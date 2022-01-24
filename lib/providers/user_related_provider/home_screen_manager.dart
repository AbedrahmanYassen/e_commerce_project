import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class HomeScreenManager with ChangeNotifier {
  List<QueryDocumentSnapshot> documents = [];
  void getDocuments() async {
    documents = [];
    List<QueryDocumentSnapshot> value = await FirebaseFirestore.instance
        .collection('products')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        documents.add(element);
      });
      return documents;
    }).then((value) {
      documents = value;
      notifyListeners();
      return value;
    });
  }
}
