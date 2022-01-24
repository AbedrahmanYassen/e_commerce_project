import 'package:ecommerce_app_training/main.dart';
import 'package:ecommerce_app_training/screens/profile_screen/profile_home_screen.dart';
import 'package:ecommerce_app_training/widgets/store_home_screen_widgets/list_of_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreHomeScreen extends StatefulWidget {
  const StoreHomeScreen({Key? key}) : super(key: key);

  @override
  _StoreHomeScreenState createState() => _StoreHomeScreenState();
}

class _StoreHomeScreenState extends State<StoreHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.settings,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 35,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
            child: IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProfileScreen();
                    },
                  ),
                );
              },
            ),
            backgroundColor: Colors.black,
          ),
        ],
        bottom: TabBar(
          labelColor: Colors.black,
          indicatorColor: Colors.black,
          labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          controller: tabController,
          tabs: [
            Tab(
              text: 'Tablets',
            ),
            Tab(
              text: 'laptops',
            ),
            Tab(
              text: 'PCs',
            )
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: tabController,
          children: [
            ListOfProducts(
              category: 'Tablets',
            ),
            ListOfProducts(
              category: 'Laptops',
            ),
            ListOfProducts(
              category: 'PCs',
            ),
          ],
        ),
      ),
    );
  }
}
