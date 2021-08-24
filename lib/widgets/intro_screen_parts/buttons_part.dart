import 'package:flutter/material.dart';

class ButtonsPartFromTheIntroScreen extends StatelessWidget {
  final double screenWidth;
  const ButtonsPartFromTheIntroScreen({Key? key, required this.screenWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: screenWidth * 0.95,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Sign Up'),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: screenWidth * 0.95,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Log In'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: TextButton(
            onPressed: () {},
            child: Text('skip for now '),
          ),
        ),
      ],
    );
  }
}
