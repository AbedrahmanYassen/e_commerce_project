import 'package:flutter/material.dart';

class TextFieldWidgetForSignUpAndLogIn extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  const TextFieldWidgetForSignUpAndLogIn(
      {Key? key, required this.hintText, required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(241, 244, 251, 1),
      child: TextField(
        controller: textEditingController,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white10),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white12))),
      ),
    );
  }
}
