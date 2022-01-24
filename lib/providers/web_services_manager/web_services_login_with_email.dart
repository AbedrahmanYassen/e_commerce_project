import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_training/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WebServicesLogInWithEmailAndPassword with ChangeNotifier {
  void signinWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseFirestore.instance
          .collection('users')
          .doc(email)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        Map data = documentSnapshot.data() as Map;
        if (data['typ'] == 'admin') {
          Navigator.of(context)
              .pushNamed(RouteGenerator.adminRelatedOperationScreen);
        } else {
          Navigator.of(context).pushNamed(RouteGenerator.storeHomeScreen);
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: 'Wrong password provided for that user.');
      }
    }
  }
}
