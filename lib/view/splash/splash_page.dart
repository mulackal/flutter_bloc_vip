/*
 * Copyright (c) 2021, Vipin.
 */
import 'package:flutter_template_vip/base/base_page.dart';
import 'package:flutter_template_vip/bloc/common/common_bloc.dart';
import 'package:flutter_template_vip/data/service/constants.dart';
import 'package:flutter_template_vip/util/common_util.dart';
import 'package:flutter_template_vip/util/my_navigator.dart';
import 'package:flutter_template_vip/util/resource_string.dart';

import 'package:flutter_template_vip/util/screenSize_controller.dart';
import 'package:flutter_template_vip/util/screen_widgetsize_util.dart';
import 'package:flutter_template_vip/util/styles/app_colors.dart';
import 'package:flutter_template_vip/util/styles/app_text_styles.dart';
import 'package:flutter_template_vip/view/cart/mycart_page.dart';

import 'package:flutter_template_vip/view/login/login_page.dart';
import 'package:flutter_template_vip/widgets/gradientBackground.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends BasePage {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends BasePageState<SplashScreen> {



  @override
  void initState() {
    super.initState();

    BlocProvider.of<CommonBloc>(context).setIsSplash(true);


    navigate();
  }




  @override
  dispose() {
    super.dispose();
  }

  navigate() {
    Timer(new Duration(seconds: 1), () {

      if (sessionValues.getBoolSession(SharedPrefKeys.walkthrough) ?? false) {
        if (sessionValues.getBoolSession(SharedPrefKeys.loggedIn) ?? false) {
          showPage(LoginPages.routeName);
          print("splash = loggedIn");
        } else {
          showPage(LoginPages.routeName);
          print("splash = not loggedIn");
        }
      } else {
        showPage(LoginPages.routeName);
        print("splash = walkthrough");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    /** this is for adjust the widget size for different screen size**/
    ScreenSizeConfig().init(context);
    ScreenSizeWidgetUtil();

    return Scaffold(
      body: Stack(
        children: <Widget>[

          GradientBackground(AppColors.bg_top,AppColors.bg_bottom),

         Center(
           child: Text("Splash Loading...",style: AppTextStyles.semilargeTextStyleBlackBold,),
         ),
        ],
      ),
    );
  }

  void showPage(String routeName) {
    Timer(
        new Duration(seconds: 3),
        () => {

              if (routeName == "/home")
                {
                  MyNavigator.goToReplaceNextPage(context, LoginPages.routeName)
                }
              else if (routeName == "/onboard")
                {
              MyNavigator.goToReplaceNextPage(context, LoginPages.routeName)
                }
              else
                {
                  MyNavigator.goToReplaceNextPage(context, LoginPages.routeName)
                }
            });
  }
}
