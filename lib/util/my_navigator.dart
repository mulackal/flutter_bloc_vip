import 'package:flutter_template_vip/util/screen_argument.dart';

import 'package:flutter/material.dart';

class MyNavigator {

  static void goToNextPage(BuildContext context,String keypage) {
    Navigator.of(context).pushNamed(keypage);
  }

  static void goToNextPageWithArgument(BuildContext context,String keypage,ScreenArguments arguments) {
    Navigator.of(context).pushNamed(keypage,arguments: arguments);
  }

  static void goToReplaceNextPage(BuildContext context,String keypage) {
    Navigator.of(context).pushReplacementNamed(keypage);
  }

  static void goToReplaceNextPageWithArgument(BuildContext context,String keypage,ScreenArguments arguments) {
    Navigator.of(context).pushReplacementNamed(keypage,arguments: arguments);
  }

  static void removePaageUntil(BuildContext context,String keypage, Widget page) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => page
        ),
        ModalRoute.withName(keypage)
    );
  }

  static void popUp(BuildContext context) {
    Navigator.of(context).pop();
  }
  static void popUpWithArgment(BuildContext context,ScreenArguments arguments) {
    Navigator.of(context).pop(arguments);
  }
}
