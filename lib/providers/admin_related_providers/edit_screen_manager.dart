import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditScreenManager with ChangeNotifier {
  CollectionReference users = FirebaseFirestore.instance.collection('products');

  Future<void> updateUser(
      {required String documentId,
      required String name,
      required String price,
      required String category,
      required String description,
      required String imageUrl}) {
    return users
        .doc(documentId)
        .update({
          'name': name,
          'price': price,
          'category': category,
          'description': description,
          'imageUrl': imageUrl,
        })
        .then((value) => Fluttertoast.showToast(msg: 'Added'))
        .catchError((error) => print("Failed to update user: $error"));
  }
}
