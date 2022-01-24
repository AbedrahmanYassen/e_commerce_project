import 'package:ecommerce_app_training/providers/admin_related_providers/add_screen_manager.dart';
import 'package:ecommerce_app_training/providers/admin_related_providers/edit_screen_manager.dart';
import 'package:ecommerce_app_training/providers/admin_related_providers/orders_screen_provider.dart';
import 'package:ecommerce_app_training/providers/bottom_navigation_bar_manager.dart';
import 'package:ecommerce_app_training/providers/profile_screen_provider.dart';
import 'package:ecommerce_app_training/providers/user_related_provider/home_screen_manager.dart';
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
        ChangeNotifierProvider(
          create: (_) => AddScreenManager(),
        ),
        ChangeNotifierProvider(
          create: (_) => EditScreenManager(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeScreenManager(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrdersScreenProvider(),
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
      initialRoute: RouteGenerator.storeHomeScreen,
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
