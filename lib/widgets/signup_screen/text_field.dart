import 'package:flutter/material.dart';

class TextFieldWidgetForSignUp extends StatelessWidget {
  final String hintText;
  const TextFieldWidgetForSignUp({Key? key, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(241, 244, 251, 1),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white10),
          ),
        ),
      ),
    );
  }
}
