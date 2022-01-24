import 'package:ecommerce_app_training/screens/admin_related_screens/add_screen.dart';
import 'package:ecommerce_app_training/screens/admin_related_screens/admin_specefic_operations.dart';
import 'package:ecommerce_app_training/screens/admin_related_screens/edit_screen.dart';
import 'package:ecommerce_app_training/screens/admin_related_screens/orders_for_shiping.dart';
import 'package:ecommerce_app_training/screens/admin_related_screens/view_products_screen.dart';
import 'package:ecommerce_app_training/screens/intro_screen_page.dart';
import 'package:ecommerce_app_training/screens/login_screen.dart';
import 'package:ecommerce_app_training/screens/signup_screen.dart';
import 'package:ecommerce_app_training/screens/user_related_screens/product_screen.dart';
import 'package:ecommerce_app_training/screens/user_related_screens/store_home_screen.dart';
import 'package:ecommerce_app_training/widgets/store_home_screen_widgets/list_of_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RouteGenerator {
  static const String introScreen = '/introScreen';
  static const String signInScreen = '/signInScreen';
  static const String logInScreen = '/logInScreen';
  static const String adminRelatedOperationScreen = '/adminSpecificOperations';
  static const String editScreen = '/editScreen';
  static const String viewScreen = '/viewScreen';
  static const String addScreen = '/addScreen';
  static const String storeHomeScreen = '/storeHomeScreen';
  static const String productScreen = '/productScreen';
  static const String ordersScreen = '/ordersScreen';

  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case introScreen:
        return MaterialPageRoute(builder: (_) => IntroScreenPart());
      case signInScreen:
        return MaterialPageRoute(
          builder: (_) => SignUpScreen(),
        );
      case logInScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case adminRelatedOperationScreen:
        return MaterialPageRoute(builder: (_) {
          return AdminSpecificOperations();
        });
      case editScreen:
        return MaterialPageRoute(builder: (_) {
          return EditScreen(
            currentName: 'currentName',
            currentImage: 'currentImage',
            currentCategory: 'currentCategory',
            description: 'description',
            currentPrice: 50,
            documentId: 'whatever',
          );
        });
      case viewScreen:
        return MaterialPageRoute(builder: (_) {
          return ViewProductsScreen();
        });
      case addScreen:
        return MaterialPageRoute(builder: (_) {
          return AddScreen();
        });
      case storeHomeScreen:
        return MaterialPageRoute(builder: (_) {
          return StoreHomeScreen();
        });
      case ordersScreen:
        return MaterialPageRoute(builder: (_) {
          return OrdersForShipingScreen();
        });
      /* case productScreen:
        return MaterialPageRoute(builder: (_) {
          return ProductScreen();
        });*/
      default:
        return MaterialPageRoute(builder: (_) => IntroScreenPart());
    }
  }
}
