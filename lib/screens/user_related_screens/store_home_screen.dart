import 'package:ecommerce_app_training/main.dart';
import 'package:ecommerce_app_training/widgets/store_home_screen_widgets/list_of_products.dart';
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
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.battery_unknown,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.email,
              color: Colors.black,
            ),
          ),
          CircleAvatar(
            child: Text('3'),
            backgroundColor: Colors.black,
          ),
        ],
        bottom: TabBar(
          labelColor: Colors.black,
          labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          controller: tabController,
          tabs: [
            Tab(
              text: 'tab 1',
            ),
            Tab(
              text: 'tab 2',
            ),
            Tab(
              text: 'tab 3',
            )
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: tabController,
          children: [
            ListOfProducts(),
            ListOfProducts(),
            ListOfProducts(),
          ],
        ),
      ),
    );
  }
}
