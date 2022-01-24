import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_training/models/User.dart';
import 'package:flutter/cupertino.dart';

class UserDataProvider with ChangeNotifier {
  User user = new User(
      name: '',
      email: '',
      type: ' ',
      favourites: [],
      ordersIfAdmin: [],
      imageUrl: '');
  String userID = 'abedrahmanyassen@gmail.com';
  void getTheUserData() {
    FirebaseFirestore.instance
        .collection('users')
        .doc('$userID')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map data = documentSnapshot.data() as Map;
        user = User(
            name: data['full_name'],
            email: data['email'],
            type: data['typ'],
            favourites: data['favourites'],
            ordersIfAdmin: data['orders_if_admin'],
            imageUrl: data['imageUrl']);
      }
    });
  }
}
