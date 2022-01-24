import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_training/models/order.dart';
import 'package:flutter/cupertino.dart';

class OrdersScreenProvider with ChangeNotifier {
  List<Order> orders = [
    Order(
        productName: ['tablet blah blah '],
        emailOfTheSender: 'emailOfTheSender')
  ];
  String userID = "abedrahmanyassen@gmail.com";
  void getOrders() {
    void getTheUserData() {
      FirebaseFirestore.instance
          .collection('users')
          .doc('$userID')
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          Map data = documentSnapshot.data() as Map;
          orders = data['orders_if_admin'];
        }
      });
    }
  }
}
