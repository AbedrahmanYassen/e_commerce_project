import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WebServicesSingUpScreen with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  void createAccountUsingEmailAndPassword(
      {required String email,
      required String password,
      required String fullName}) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      verifyYourAccount();
      addUser(fullName: fullName, email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
          msg: 'The account already exists for that email.',
        );
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  void verifyYourAccount() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  Future<void> addUser({required String fullName, required email}) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return users
        .doc(email)
        .set({'full_name': fullName, 'email': email})
        .then((value) => Fluttertoast.showToast(msg: "User Added"))
        .catchError(
            (error) => Fluttertoast.showToast(msg: 'the error is $error'));
  }
}
