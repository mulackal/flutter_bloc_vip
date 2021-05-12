

import 'package:flutter_template_vip/util/screenSize_controller.dart';



class ScreenSizeWidgetUtil {

  factory ScreenSizeWidgetUtil() {
    return _singleton;
  }

  static final ScreenSizeWidgetUtil _singleton = ScreenSizeWidgetUtil._internal();
  ScreenSizeWidgetUtil._internal() {
    print("Instance created ScreenSizeTextUtil");
  }

  final double _refrenceScreenHeight = 620;
  final double _refrenceScreenWidth = 360;

  double _loginbutton_hight = 45.0;
  double get loginButtonHight => _loginbutton_hight;

  double _camara_button_hight = 40.0;
  double get camara_button_hight => _camara_button_hight;

  double _edit_button_hight = 25.0;
  double get edit_button_hight => _edit_button_hight;


  double _splash_hight = 160.0;
  double get splash_hight => _splash_hight;

  double _profile_hight = 230.0;
  double get profile_hight => _profile_hight;
  double _profile_image = 130.0;
  double get profile_image => _profile_image;
  double _profile_image_top = 80.0;
  double get profile_image_top => _profile_image_top;
  double _logo_hight = 150.0;
  double get logo_hight => _logo_hight;




  double setHightByScreenSize(double selection_hight) {
    var hights = (selection_hight * ScreenSizeConfig.safeHeight) / _refrenceScreenHeight;

    if(selection_hight < hights)
      selection_hight = hights;
    else
      selection_hight = hights;

    return selection_hight;
  }

  double setWidthByScreenSize(double selection_width) {
    var widths = (selection_width * ScreenSizeConfig.safeWidth) / _refrenceScreenWidth;

    if(selection_width < widths)
      selection_width = widths;
    else
      selection_width = widths;

    return selection_width;
  }

}