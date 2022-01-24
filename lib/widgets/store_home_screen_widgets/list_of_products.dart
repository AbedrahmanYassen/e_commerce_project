import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_training/models/product.dart';
import 'package:ecommerce_app_training/providers/user_related_provider/home_screen_manager.dart';
import 'package:ecommerce_app_training/routes.dart';
import 'package:ecommerce_app_training/screens/user_related_screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ListOfProducts extends StatefulWidget {
  final String category;
  const ListOfProducts({required this.category, Key? key}) : super(key: key);

  @override
  _ListOfProductsState createState() => _ListOfProductsState();
}

class _ListOfProductsState extends State<ListOfProducts> {
  List<QueryDocumentSnapshot> documents = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeScreenManager homeScreenManager =
        Provider.of<HomeScreenManager>(context);
    homeScreenManager.getDocuments();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildListHeader(),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('products')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData)
                    return Center(child: new CircularProgressIndicator());
                  List data = getAllProducts(snapshot);
                  List dataCategorized = [];
                  for (Product product in data) {
                    if (product.category == widget.category) {
                      dataCategorized.add(product);
                    }
                  }
                  return new ListView.builder(
                    itemBuilder: (context, index) {
                      return ProductCard(
                        product: dataCategorized[index] ?? [],
                        callback: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductScreen(
                                    product: dataCategorized[index]);
                              },
                            ),
                          );
                        },
                      );
                    },
                    itemCount: dataCategorized.length,
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget _buildListHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.category,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        Row(
          children: [
            Text(
              'sort by ',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.keyboard_arrow_down),
            ),
          ],
        )
      ],
    );
  }

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('products');

  List<Product> getAllProducts(AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
    return snapshot.data!.docs
        .map(
          (doc) => Product(
            imageUrl: doc['image_url'],
            productPrice: doc['price'],
            productName: doc['name'],
            description: doc['description'],
            brand: doc['brand'],
            category: doc['category'],
          ),
        )
        .toList();
  }
}

class ProductCard extends StatelessWidget {
  //TODO:Should be replaced with Product object
  final Product product;
  final Function callback;

  const ProductCard({required this.product, required this.callback, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: GestureDetector(
        onTap: () {
          callback();
        },
        child: Card(
          elevation: 0.1,
          color: Color.fromRGBO(246, 246, 246, 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: FaIcon(FontAwesomeIcons.heart),
                  ),
                ],
              ),
              Image.network(
                product.imageUrl,
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                product.productName,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(product.productPrice.toString()),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
