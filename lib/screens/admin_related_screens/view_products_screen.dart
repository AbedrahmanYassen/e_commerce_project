import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_training/models/product.dart';
import 'package:ecommerce_app_training/widgets/store_home_screen_widgets/list_of_products.dart';
import 'package:flutter/material.dart';

class ViewProductsScreen extends StatefulWidget {
  const ViewProductsScreen({Key? key}) : super(key: key);

  @override
  _ViewProductsScreenState createState() => _ViewProductsScreenState();
}

class _ViewProductsScreenState extends State<ViewProductsScreen> {
  TextEditingController searchTextEditingController =
      new TextEditingController();
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
      setState(() {
        documents = value;
      });
      return value;
    });
  }

  @override
  void initState() {
    super.initState();
    getDocuments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: searchTextEditingController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      Map currentObject = documents[index].data() as Map;
                      return ProductCard(
                        product: Product(
                          imageUrl: 'assets/images/add.jpg',
                          productPrice: 'doc[price]',
                          productName: 'doc[name]',
                          description: 'doc[description]',
                          brand: 'doc[brand]',
                          /*'doc[colors_avaliable]'*/
                          category: 'doc[category]',
                        ),
                        callback: () {},
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
/*
firestoreInstance.collection("users").get().then((querySnapshot) {
      //print(querySnapshot);
      print("users: results: length: " + querySnapshot.docs.length.toString());
      querySnapshot.docs.forEach((value) {
        print("users: results: value");
        print(value.data());
      });
    }).catchError((onError) {
      print("getCloudFirestoreUsers: ERROR");
      print(onError);
    });
 */
