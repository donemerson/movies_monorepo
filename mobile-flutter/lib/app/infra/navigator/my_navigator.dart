import 'package:flutter/cupertino.dart';

class MyNavigator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static Future toNamed<T extends Object?>(String routeName) async {
    return await navigatorKey.currentState!.pushNamed<T>(routeName);
  }

  static Future offNamed<T extends Object?>(String routeName) async {
    return await navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (_) => false);
  }
}
