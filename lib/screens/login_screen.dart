import 'package:ecommerce_app_training/widgets/facebook_login_signup_button.dart';
import 'package:ecommerce_app_training/widgets/google_login_signup_button.dart';
import 'package:ecommerce_app_training/widgets/signup_screen/text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildIconOfTheScreen(),
                SizedBox(
                  height: 15,
                ),
                _buildSizedDividedTextField(
                    width: screenWidth * 0.9, hintText: 'Email '),
                _buildSizedDividedTextField(
                    width: screenWidth * 0.9, hintText: 'Password '),
                _buildLoginButton(width: screenWidth * 0.9, height: 50),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                _buildOrDivider(),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: FacebookButton(
                    textOnTheButton: 'Log In with facebook',
                    width: screenWidth * 0.9,
                    height: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: GoogleButton(
                    height: 50,
                    width: screenWidth * 0.9,
                    textOnTheButton: 'Log In with Google',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 70,
                  ),
                  child: _buildGoToSignUpScreen(),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget _buildIconOfTheScreen() {
    return Column(
      children: [
        Transform.rotate(
          angle: 270,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/evon.jpg',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOrDivider() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: 140, child: Divider()),
          Text('Or'),
          SizedBox(width: 140, child: Divider())
        ],
      ),
    );
  }

  Widget _buildSizedDividedTextField(
      {required double width, required String hintText}) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          TextFieldWidgetForSignUp(
            hintText: hintText,
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget _buildLoginButton({required double width, required double height}) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          'Log In',
        ),
      ),
    );
  }

  Widget _buildGoToSignUpScreen() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t you have an account?',
          style: TextStyle(color: Colors.grey, fontSize: 15),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Sign Up',
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}
