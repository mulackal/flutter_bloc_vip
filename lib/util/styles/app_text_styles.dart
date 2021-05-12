
import 'package:flutter_template_vip/util/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../screenSize_controller.dart';

class AppTextStyles {
  AppTextStyles._();

  static final toplargeTextStyleBlackBold = GoogleFonts.poppins(
      fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 5.2 :
      ScreenSizeConfig.font_size * 5.1, fontWeight: FontWeight.bold, color: Colors.black);


  static final largeTextStyleWhiteBoldTitle = GoogleFonts.blackOpsOne(
      fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 7 :
      ScreenSizeConfig.font_size * 6,  color: AppColors.secondaryColor);


  static final largeTextStyleWhiteBold = GoogleFonts.poppins(
      fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 6 :
      ScreenSizeConfig.font_size * 5, fontWeight: FontWeight.bold, color: Colors.white);
  static final largeTextStyleBlackBold = GoogleFonts.poppins(
      fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 6 :
      ScreenSizeConfig.font_size * 5, fontWeight: FontWeight.bold, color: AppColors.font_color);

  static final largeTextStyleWhite = GoogleFonts.poppins(
      fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 6 :
      ScreenSizeConfig.font_size * 5,  color: Colors.white);
  static final largeTextStyleBlack = GoogleFonts.poppins(
      fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 6 :
      ScreenSizeConfig.font_size * 5,  color: AppColors.font_color);


  static final semilargeTextStyleWhiteBold = GoogleFonts.poppins(
      fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 4 :
      ScreenSizeConfig.font_size * 3.5, fontWeight: FontWeight.bold, color: Colors.white);

  static final semilargeTextStyleBlackBold = GoogleFonts.poppins(
      fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 4 :
      ScreenSizeConfig.font_size * 3.5, fontWeight: FontWeight.bold, color: AppColors.font_color);

  static final semilargeTextStyleBlackBoldInr = GoogleFonts.josefinSans(
      fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 4 :
      ScreenSizeConfig.font_size * 3.5, fontWeight: FontWeight.bold, color: AppColors.font_color);


  static final semilargeTextStyleWhite = GoogleFonts.poppins(
      fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 4 :
      ScreenSizeConfig.font_size * 3.5,  color: Colors.white);
  static final semilargeTextStyleBlack = GoogleFonts.poppins(
      fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 4 :
      ScreenSizeConfig.font_size * 3.5,  color: AppColors.font_color);
  static final semilargeTextStyleBlackInr = GoogleFonts.josefinSans(
      fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 4 :
      ScreenSizeConfig.font_size * 3.5,  color: AppColors.font_color);

  static final mediumTextStyleWhite =
      GoogleFonts.poppins(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 3.5 :
      ScreenSizeConfig.font_size * 3, color: Colors.white);

  static final mediumTextStyleWhiteBold =
  GoogleFonts.poppins(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 3.5 :
  ScreenSizeConfig.font_size * 3, color: Colors.white,fontWeight: FontWeight.bold,);

  static final mediumTextStyleGreen =
  GoogleFonts.poppins(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 3.5 :
  ScreenSizeConfig.font_size * 3, color: AppColors.green,fontWeight: FontWeight.bold,);

  static final mediumTextStyleRed =
  GoogleFonts.poppins(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 3.5 :
  ScreenSizeConfig.font_size * 3, color: AppColors.red,fontWeight: FontWeight.bold,);



  static  final  mediumTextStyleBlack =
      GoogleFonts.poppins(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 3.5 :
     ScreenSizeConfig.font_size * 3, color: AppColors.font_color);
  static  final  mediumTextStylelightBlack =
  GoogleFonts.poppins(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 3.5 :
  ScreenSizeConfig.font_size * 3, color: AppColors.light_font);

  static  final  mediumTextStyleInr =
  GoogleFonts.josefinSans(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 3.5 :
  ScreenSizeConfig.font_size * 3, color: AppColors.font_color);

  static  final  mediumTextStyleBlackLine =
  GoogleFonts.poppins(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 3.5 :
  ScreenSizeConfig.font_size * 3, color: AppColors.font_color, decoration: TextDecoration.lineThrough,);

  static final mediumSemiTextStyleBlack =
  GoogleFonts.poppins(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 4.0 :
  ScreenSizeConfig.font_size * 3.5, color: AppColors.font_color);

  static final mediumSemiTextStyleGray =
  GoogleFonts.poppins(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 4.0 :
  ScreenSizeConfig.font_size * 3.5, color: AppColors.gray);

  static final mediumSemiTextStyleWhite =
  GoogleFonts.poppins(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 4.0 :
  ScreenSizeConfig.font_size * 3.5, color: AppColors.white);

  static final mediumTextStylelighGreen =
  GoogleFonts.poppins(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 3.5 :
  ScreenSizeConfig.font_size * 3, color: AppColors.secondaryColor);
  static final mediumTextStylelighAsset =
  GoogleFonts.poppins(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 3.5 :
  ScreenSizeConfig.font_size * 3, color: AppColors.accentColor);

  static final mediumTextStyleBlackBold =
  GoogleFonts.poppins(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 3.5 :
  ScreenSizeConfig.font_size * 3, color: AppColors.font_color,fontWeight: FontWeight.bold,);

  static final mediumTextStyleBlackBoldInr =
  GoogleFonts.josefinSans(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 3.5 :
  ScreenSizeConfig.font_size * 3, color: AppColors.font_color,fontWeight: FontWeight.bold,);


  static final tinyTextStyleWhite =
      GoogleFonts.poppins(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 3 :
      ScreenSizeConfig.font_size * 2.5, color: Colors.white);

  static final tinyTextStyleWhiteBold =
  GoogleFonts.poppins(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 3 :
  ScreenSizeConfig.font_size * 2.5, color: Colors.white,fontWeight: FontWeight.bold);

  static final tinyTextStyleBlack =
      GoogleFonts.poppins(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 3 :
      ScreenSizeConfig.font_size * 2.5, color: AppColors.font_color);

  static final tinyTextStyleBlackBold =
  GoogleFonts.poppins(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 3 :
  ScreenSizeConfig.font_size * 2.5, color: AppColors.font_color,fontWeight: FontWeight.bold);
  static final tinyTextStyleBlackBoldInr =
  GoogleFonts.josefinSans(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 3 :
  ScreenSizeConfig.font_size * 2.5, color: AppColors.font_color,fontWeight: FontWeight.bold);

  static final tinyTextStyleBlackBoldInrCrossline =
  GoogleFonts.josefinSans(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 3 :
  ScreenSizeConfig.font_size * 2.5, color: AppColors.font_color,fontWeight: FontWeight.bold,
  decoration: TextDecoration.lineThrough,);


  static final tinyTextStyleGray =
  GoogleFonts.poppins(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 3 :
  ScreenSizeConfig.font_size * 2.5, color: AppColors.gray);

  static final tinyTextStyleGrayInr =
  GoogleFonts.josefinSans(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 3 :
  ScreenSizeConfig.font_size * 2.5, color: AppColors.gray);

  static final mediumTextStyleGrayUnderline =
  GoogleFonts.poppins(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 3.5 :
  ScreenSizeConfig.font_size * 3, color: AppColors.font_color, fontWeight: FontWeight.bold,
  decoration:TextDecoration.underline,);

  static final mediumTextStyleAppUnderline =
  GoogleFonts.poppins(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 3.5 :
  ScreenSizeConfig.font_size * 3, color: AppColors.secondaryLight, fontWeight: FontWeight.bold,
    decoration:TextDecoration.underline,);

  static final tinyTextStyleRed =
  GoogleFonts.poppins(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 2.5 :
  ScreenSizeConfig.font_size * 2, color: AppColors.red);
  static final tinyTextStyleRedInr =
  GoogleFonts.josefinSans(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 2.5 :
  ScreenSizeConfig.font_size * 2, color: AppColors.red);

  static final tinyTextStylelighGreen =
  GoogleFonts.poppins(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 3 :
  ScreenSizeConfig.font_size * 2.5, color: AppColors.secondaryLight);

  static final tinyTextStyleGreen =
  GoogleFonts.poppins(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 3 :
  ScreenSizeConfig.font_size * 2.5, fontWeight: FontWeight.bold, color: AppColors.bg_bottom);

  static final tinyTextStyleSmallWhite =
  GoogleFonts.poppins(fontSize: ScreenSizeConfig.orientation? ScreenSizeConfig.font_size * 2.5 :
  ScreenSizeConfig.font_size * 2, color: Colors.white);
}
