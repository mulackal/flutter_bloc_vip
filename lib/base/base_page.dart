
import 'package:flutter_template_vip/util/logger.dart';
import 'package:flutter_template_vip/util/styles/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_template_vip/data/service/shared_preference_service.dart';
import 'package:flutter_template_vip/data/service/constants.dart' show SharedPrefKeys;

/*
 * Copyright (c) 2021, Vipin.
 */

class BasePage extends StatefulWidget {
  BasePage({Key key}) : super(key: key);

  @override
  BasePageState createState() => BasePageState();
}



class BasePageState<T extends BasePage> extends State<T> {

  var isLoading = false;
  SharedPreferencesService sharedPrefService;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /** initialize session**/
    initSession();

  }

  void initSession() async {
    sharedPrefService = await SharedPreferencesService.instance;

    try {
      var route = ModalRoute.of(context).settings.name;
      print("***Base page-lock:####- $route");
      if (route != null) {
        sharedPrefService.setStringSesssion(SharedPrefKeys.currentScreen, route);
       }
    }catch(e){
      e.toString();
    }
  }

  SharedPreferencesService get sessionValues => sharedPrefService;


  void showLoadingDialoge() {

    new Future.delayed(Duration.zero, ()
    {
      if(!isLoading)
      showDialog(context: context,
          builder: (BuildContext context) {
            return loader;
          });
      isLoading = true;
    });

  }


  void hideLoadingDialoge(){
   if(isLoading)
    Navigator.of(context).pop();
    isLoading = false;
  }

  static final loader =  Center(
    child: new AlertDialog(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      content: spinkitloader,
    ),
  );

  static final spinkitloader  = Center(
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
       // PouringHourGlass
        SpinKitWave(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: index.isEven ? AppColors.secondaryLight : AppColors.white,
              ),
            );
          },
      size: 50.0,
        ),

        /*SizedBox(height: 13.0,),
        Text(AppLocalizations.getTranslate(context,LanguageKeys.please_wait),
            style: AppTextStyles.mediumTextStyleWhiteBold),*/

      ],
    ),

  );

  void showToast(String msg, {int duration}) {
    Fluttertoast.showToast(msg: msg, gravity: ToastGravity.BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }


}
