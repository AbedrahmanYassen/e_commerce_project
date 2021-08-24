import 'package:ecommerce_app_training/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminSpecificOperations extends StatelessWidget {
  const AdminSpecificOperations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AdminSpecificOperationsScreenIcon(
                  width: screenWidth, height: 150),
              OperationButton(
                textOnTheButton: 'Edit',
                width: screenWidth * 0.9,
                height: 60,
                function: () {
                  Navigator.of(context).pushNamed(RouteGenerator.editScreen);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              OperationButton(
                textOnTheButton: 'Add',
                height: 60,
                width: screenWidth * 0.9,
                function: () {
                  Navigator.of(context).pushNamed(RouteGenerator.addScreen);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              OperationButton(
                textOnTheButton: 'View',
                height: 60,
                width: screenWidth * 0.9,
                function: () {
                  Navigator.of(context).pushNamed(RouteGenerator.viewScreen);
                },
              ),
            ],
          ),
        ),
      ),
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
  final String textOnTheButton;
  final double width;
  final double height;
  final Function function;
  const OperationButton(
      {Key? key,
      required this.textOnTheButton,
      required this.height,
      required this.width,
      required this.function})
      : super(key: key);
  final TextStyle buttonTextStyle = const TextStyle(fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
            onPressed: () {
              function();
            },
            child: Text(
              textOnTheButton,
              style: buttonTextStyle,
            )));
  }
}
