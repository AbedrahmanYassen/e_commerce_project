import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class AddScreenManager with ChangeNotifier {
  Future<void> addUser(
      {required String name,
      required String price,
      required String category,
      required String description,
      required String brand,
      required BuildContext context}) {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
    return products
        .doc(name)
        .set({
          'name': name,
          'price': price,
          'category': category,
          'description': description,
          'image_url': 'empty right now',
          'brand': brand,
        })
        .then((value) => Fluttertoast.showToast(msg: "User Added"))
        .catchError(
            (error) => Fluttertoast.showToast(msg: 'the error is $error'));
  }
}
