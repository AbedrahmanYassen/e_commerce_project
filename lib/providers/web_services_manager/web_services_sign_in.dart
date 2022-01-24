import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WebServicesSingUpScreen with ChangeNotifier {
  String type = 'normalUser';
  String collectionNameRelatedToTheAdmin = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  void createAccountUsingEmailAndPassword(
      {required String email,
      required String password,
      required String fullName,
      required BuildContext context}) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      verifyYourAccount();
      addUser(fullName: fullName, email: email, context: context);
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

  Future<void> addUser(
      {required String fullName,
      required email,
      required BuildContext context}) {
    _showMyDialog(context);
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return users
        .doc(email)
        .set({
          'full_name': fullName,
          'email': email,
          'typ': type,
          'products_related_to_admin': email
        })
        .then((value) => Fluttertoast.showToast(msg: "User Added"))
        .catchError(
            (error) => Fluttertoast.showToast(msg: 'the error is $error'));
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          actions: <Widget>[
            TextButton(
              child: const Text('Admin'),
              onPressed: () {
                type = 'admin';
              },
            ),
            TextButton(
              child: const Text('User'),
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }
}
