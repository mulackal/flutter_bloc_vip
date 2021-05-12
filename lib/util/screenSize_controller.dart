import 'package:flutter/widgets.dart';



class ScreenSizeConfig {

  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double safeAreaHorizontal;
  static double safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;
  static double safeHeight;
  static double safeWidth;
  static double font_size;
  static bool orientation = true;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    orientation = _mediaQueryData.orientation == Orientation.portrait;

      screenWidth = _mediaQueryData.size.width;
      screenHeight = _mediaQueryData.size.height;
      blockSizeHorizontal = screenWidth / 100;
      blockSizeVertical = screenHeight / 100;


    safeAreaHorizontal = _mediaQueryData.padding.left +
        _mediaQueryData.padding.right;
    safeAreaVertical = _mediaQueryData.padding.top +
        _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth -
        safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight -
        safeAreaVertical) / 100;

    safeWidth  = (screenWidth - safeAreaHorizontal);
    safeHeight = (screenHeight - safeAreaVertical);

    if (safeBlockHorizontal > safeBlockVertical)
      font_size = safeBlockVertical;
    else
      font_size = safeBlockHorizontal;

  }


}