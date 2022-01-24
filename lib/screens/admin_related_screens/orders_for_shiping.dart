import 'package:ecommerce_app_training/models/order.dart';
import 'package:ecommerce_app_training/providers/admin_related_providers/orders_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersForShipingScreen extends StatelessWidget {
  const OrdersForShipingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrdersScreenProvider ordersScreenProvider = Provider.of(context);
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return OrderCard(
            order: ordersScreenProvider.orders[index],
          );
        },
        itemCount: ordersScreenProvider.orders.length,
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final Order order;
  const OrderCard({required this.order, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(order.emailOfTheSender),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.done,
                    color: Colors.black,
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      order.productName[index],
                    ),
                  );
                },
                itemCount: order.productName.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
