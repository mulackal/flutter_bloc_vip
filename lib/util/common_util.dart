/*
 * Copyright (c) 2021, Vipin.
 */


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum DeviceCategory { Phone, Tablet }

class CommonUtil {

  factory CommonUtil() {
    return _singleton;
  }

  static final CommonUtil _singleton = CommonUtil._internal();
  CommonUtil._internal() {
       print("Instance created CommonUtil");
  }


   void keyboardHide(BuildContext context) {
    try {
      // keyboard on the screen
        FocusScope.of(context).requestFocus(FocusNode()); // not refocus to textview
        /// hides the keyboard if its already open
        //FocusScope.of(context).unfocus();  //  refocus to textview
    }catch(e){

    }
   }

  String currentDate(String from) {
    var now = new DateTime.now();
    var date;
    if(from == "revers")
     date = new DateFormat("yyyy-MM-dd").format(now);
    else
      date = new DateFormat("dd-MM-yyyy").format(now);
    return date.toString();
  }
  String currentTime() {
    var now = new DateTime.now();
    var time = new DateFormat("H:m:s").format(now);
    return time.toString();
  }
  String currentDateTimeMilli() {
    var now = new DateTime.now();
     return now.millisecondsSinceEpoch.toString();
  }
  String currentDateTime() {
    var now = new DateTime.now();
    var time = new DateFormat("dd-MM-yyyy hh:mm:ss").format(now);
    return time.toString();
  }


  String dateFormater(String data) {
    try {
      print("************dateFormat2:  $data--------");
      DateTime parseDate = DateFormat('yyyy-MM-dd HH:mm:ss').parse(data);
      var inputDate = DateTime.parse(parseDate.toString());
      var outputFormat = DateFormat('dd MMM yyyy');
      var outputDate = outputFormat.format(inputDate);

      print("************dateFormat2:  ${outputDate.toString()}--------");
      return outputDate.toString();
    }catch(e){
      return data;
    }
  }




  DeviceCategory getDeviceType()  {
  final data =  MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  return data.size.shortestSide < 600 ? DeviceCategory.Phone : DeviceCategory.Tablet;
}


  /// accepts a double [scale] and returns scaled sized based on the screen
  /// orientation
   double getScaledSize(BuildContext context, double scale) =>
      scale *
          (MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.width
              : MediaQuery.of(context).size.height);


  /// accepts a double [scale] and returns scaled sized based on the screen
  /// width
   double getScaledWidth(BuildContext context, double scale) =>
      scale * MediaQuery.of(context).size.width;

  /// accepts a double [scale] and returns scaled sized based on the screen
  /// height

   double getScaledHeight(BuildContext context, double scale) =>
      scale * MediaQuery.of(context).size.height;
}