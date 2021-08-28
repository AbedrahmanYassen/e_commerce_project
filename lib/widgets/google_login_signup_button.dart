import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleButton extends StatelessWidget {
  final double width;
  final String textOnTheButton;
  final double height;
  final Function function;
  const GoogleButton(
      {Key? key,
      required this.height,
      required this.width,
      required this.textOnTheButton,
      required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function();
      },
      child: Row(
        children: [
          Container(
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.google,
                color: Colors.black,
              ),
            ),
            width: width / 5,
            height: height,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
            ),
          ),
          Container(
            width: 4 * width / 5,
            height: height,
            child: Center(
              child: Text(
                textOnTheButton,
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
          )
        ],
      ),
    );
  }
}
