import 'package:ecommerce_app_training/providers/bottom_navigation_bar_manager.dart';
import 'package:ecommerce_app_training/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminSpecificOperations extends StatelessWidget {
  const AdminSpecificOperations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    BottomNavigationBarManager bottomNavigationBarManager =
        Provider.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(
                      20,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    OperationButton(
                      height: 100,
                      width: 100,
                      function: () {
                        Navigator.of(context)
                            .pushNamed(RouteGenerator.addScreen);
                      },
                      child: _buildInsideButtonChild(
                          contentColor: Colors.grey.shade200,
                          title: 'Add',
                          iconData: Icons.add_to_photos),
                      color: Colors.black,
                    ),
                    OperationButton(
                      height: 100,
                      width: 100,
                      function: () {
                        Navigator.of(context)
                            .pushNamed(RouteGenerator.editScreen);
                      },
                      child: _buildInsideButtonChild(
                          contentColor: Colors.black,
                          title: 'Edit',
                          iconData: Icons.edit),
                      color: Colors.grey.shade200,
                    ),
                    OperationButton(
                      height: 100,
                      width: 100,
                      function: () {
                        Navigator.of(context)
                            .pushNamed(RouteGenerator.viewScreen);
                      },
                      child: _buildInsideButtonChild(
                          title: 'View',
                          iconData: Icons.view_agenda,
                          contentColor: Colors.black),
                      color: Colors.grey.shade200,
                    ),
                    OperationButton(
                      height: 100,
                      width: 100,
                      function: () {
                        Navigator.of(context)
                            .pushNamed(RouteGenerator.ordersScreen);
                      },
                      child: _buildInsideButtonChild(
                          title: 'Orders',
                          iconData: Icons.local_shipping,
                          contentColor: Colors.grey.shade200),
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInsideButtonChild(
      {required IconData iconData,
      required String title,
      required Color contentColor}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, color: contentColor),
        ),
        const SizedBox(
          height: 10,
        ),
        Icon(
          iconData,
          color: contentColor,
          size: 35,
        )
      ],
    );
  }
}

class AdminSpecificOperationsScreenIcon extends StatelessWidget {
  final double width;
  final double height;
  const AdminSpecificOperationsScreenIcon(
      {Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50, right: 15, left: 15),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: 370,
              child: Text(
                'Welcome ',
                style: GoogleFonts.kumarOne(
                    textStyle: TextStyle(
                  fontSize: 20,
                )),
              ),
            ),
            Transform.rotate(
              angle: -370,
              child: Text(
                'manager ',
                style: GoogleFonts.kumarOne(
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OperationButton extends StatelessWidget {
  final double width;
  final double height;
  final Function function;
  final Color color;
  final Widget child;
  const OperationButton(
      {Key? key,
      required this.height,
      required this.width,
      required this.function,
      required this.child,
      required this.color})
      : super(key: key);
  final TextStyle buttonTextStyle = const TextStyle(fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                35,
              ),
            ),
          ),
          onPressed: () {
            function();
          },
          child: child,
        ),
      ),
    );
  }
}
