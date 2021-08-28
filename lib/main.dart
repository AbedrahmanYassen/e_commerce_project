import 'package:ecommerce_app_training/providers/bottom_navigation_bar_manager.dart';
import 'package:ecommerce_app_training/providers/web_services_manager/login_with_google.dart';
import 'package:ecommerce_app_training/providers/web_services_manager/web_services_login_with_email.dart';
import 'package:ecommerce_app_training/providers/web_services_manager/web_services_sign_in.dart';
import 'package:ecommerce_app_training/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      child: App(),
      providers: [
        ChangeNotifierProvider(
          create: (_) => BottomNavigationBarManager(),
        ),
        ChangeNotifierProvider(
          create: (_) => WebServicesSingUpScreen(),
        ),
        ChangeNotifierProvider(
          create: (_) => LogInWithGoogle(),
        ),
        ChangeNotifierProvider(
          create: (_) => WebServicesLogInWithEmailAndPassword(),
        ),
      ],
    ),
  );
}

class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return SomethingWentWrong();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: RouteGenerator.introScreen,
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Center(
            child: Text(
              'Wrong ',
            ),
          ),
        ),
      ),
    );
  }
}
