
/*
 * Copyright (c) 2021, Vipin.
 */
import 'package:flutter_template_vip/util/screen_argument.dart';
import 'package:flutter/material.dart';


class NavigationService {

  /** this class used to we can navigate pages with out context**/

  factory NavigationService() {
    return _singletons;
  }

  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  static final NavigationService _singletons = NavigationService._internal();
  NavigationService._internal() {
       print("Instance created NavigationService");
  }

   void goToNextPage(String keypage) {
     navigatorKey.currentState.pushNamed(keypage);
  }

   void goToNextPageWithArgument(String keypage,ScreenArguments arguments) {
     navigatorKey.currentState.pushNamed(keypage,arguments: arguments);
  }

   void goToReplaceNextPage(String keypage) {
     navigatorKey.currentState.pushReplacementNamed(keypage);
  }

   void goToReplaceNextPageWithArgument(String keypage,ScreenArguments arguments) {
     navigatorKey.currentState.pushReplacementNamed(keypage,arguments: arguments);
  }

   void removePaageUntil(String keypage, Widget page) {
     navigatorKey.currentState.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page),
        ModalRoute.withName(keypage)
    );
  }

   void popUp() {
     navigatorKey.currentState.pop();
  }
   void popUpWithArgment(ScreenArguments arguments) {
     navigatorKey.currentState.pop(arguments);
  }


}