import 'package:flutter/material.dart';

class FacebookButton extends StatelessWidget {
  final double width;
  final String textOnTheButton;
  final double height;
  const FacebookButton(
      {Key? key,
      required this.height,
      required this.width,
      required this.textOnTheButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Container(
            child: Center(
              child: Text(
                'f',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            width: width / 5,
            height: height,
            decoration: BoxDecoration(
              color: Color.fromRGBO(57, 83, 134, 1),
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
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
            decoration: BoxDecoration(
              color: Color.fromRGBO(74, 110, 168, 1),
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
