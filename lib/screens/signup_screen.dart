import 'package:ecommerce_app_training/providers/web_services_manager/web_services_sign_in.dart';
import 'package:ecommerce_app_training/widgets/facebook_login_signup_button.dart';
import 'package:ecommerce_app_training/widgets/google_login_signup_button.dart';
import 'package:ecommerce_app_training/widgets/signup_screen/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    WebServicesSingUpScreen webServicesSingUpScreen =
        Provider.of(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 50,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildIconOfTheScreen(),
                  const SizedBox(
                    height: 30,
                  ),
                  _buildSizedDividedTextField(
                      width: screenWidth * 0.9,
                      hintText: 'Full name',
                      textEditingController: nameController),
                  _buildSizedDividedTextField(
                      width: screenWidth * 0.9,
                      hintText: 'Email',
                      textEditingController: emailController),
                  _buildSizedDividedTextField(
                      width: screenWidth * 0.9,
                      hintText: 'Password',
                      textEditingController: passwordController),
                  _buildSignUpButton(
                    width: screenWidth * 0.9,
                    height: 50,
                    function: () async {
                      webServicesSingUpScreen
                          .createAccountUsingEmailAndPassword(
                        fullName: nameController.text.toString().trim(),
                        email: emailController.text.toString().trim(),
                        password: passwordController.text.toString().trim(),
                        context: context,
                      );
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  _buildOrDivider(),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: FacebookButton(
                      textOnTheButton: 'Sign Up with facebook',
                      width: screenWidth * 0.9,
                      height: 50,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: GoogleButton(
                      function: () {
                        webServicesSingUpScreen.addUser(
                            fullName: 'name',
                            email: 'anything nw',
                            context: context);
                      },
                      height: 50,
                      width: screenWidth * 0.9,
                      textOnTheButton: 'Sign Up with Google',
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  _buildGoToLogInScreen()
                ],
              ),
            ),
          ),
        ),
      ),
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

  Widget _buildSizedDividedTextField(
      {required double width,
      required String hintText,
      required TextEditingController textEditingController}) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          TextFieldWidgetForSignUpAndLogIn(
            textEditingController: textEditingController,
            hintText: hintText,
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget _buildSignUpButton(
      {required double width,
      required double height,
      required Function function}) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.grey),
        onPressed: () {
          function();
        },
        child: Text(
          'Sign Up',
        ),
      ),
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

  Widget _buildGoToLogInScreen() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: TextStyle(color: Colors.grey, fontSize: 15),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Log In',
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}
