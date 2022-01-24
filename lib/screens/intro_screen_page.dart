import 'package:ecommerce_app_training/routes.dart';
import 'package:flutter/material.dart';

class IntroScreenPart extends StatelessWidget {
  const IntroScreenPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 70,
              ),
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
              const SizedBox(
                height: 40,
              ),
              Text(
                'the place where wont be disappointed',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(180, 187, 197, 1),
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: screenWidth * 0.95,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.grey),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(RouteGenerator.signInScreen);
                  },
                  child: Text('Sign Up'),
                ),
              ),
              SizedBox(
                width: screenWidth * 0.95,
                height: 50,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    side: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(RouteGenerator.logInScreen);
                  },
                  child: Text(
                    'Log In',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'skip for now ',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
