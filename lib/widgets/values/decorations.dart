import 'package:flutter/material.dart';
import 'package:flutter_template_vip/util/styles/app_colors.dart';
import 'package:flutter_template_vip/widgets/values/gradients.dart';
import 'package:flutter_template_vip/widgets/values/shadows.dart';
class Decorations {

  static const BoxDecoration secondarySideCurved = BoxDecoration(
    color: AppColors.secondaryColor,
    boxShadow: [
      Shadows.secondaryShadow,
    ],
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  static const BoxDecoration secondaryRounfCurved = BoxDecoration(
    color: AppColors.secondaryColor,
    boxShadow: [
      Shadows.secondaryShadow,
    ],
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );

  static const BoxDecoration accetRounfCurved = BoxDecoration(
    color: AppColors.accentColor,
    boxShadow: [
      Shadows.secondaryShadow,
    ],
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );
  static const BoxDecoration grayRounfCurved = BoxDecoration(
    color: AppColors.gray,
    boxShadow: [
      Shadows.secondaryShadow,
    ],
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );
  static const BoxDecoration whiteSideCurved = BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );
  static const BoxDecoration greenSideCurved = BoxDecoration(
    color: AppColors.light_green,
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );


  static final RoundedRectangleBorder cardRectShape = RoundedRectangleBorder(
    borderRadius:  BorderRadius.circular(15.0),);

  static final RoundedRectangleBorder cardRectBorder = RoundedRectangleBorder(
    side: BorderSide(color: Colors.black, width: 0.3,),
    borderRadius:  BorderRadius.circular(25.0),);


  static final RoundedRectangleBorder cardSqurBorder = RoundedRectangleBorder(
    side: BorderSide(color: Colors.grey, width: 0.1,),
    borderRadius:  BorderRadius.circular(5.0),);

  static final RoundedRectangleBorder cardSqurBackgrund = RoundedRectangleBorder(
    borderRadius:  BorderRadius.circular(5.0),);

  static const BoxDecoration redRoundCurved = BoxDecoration(
    color: AppColors.red,
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );

  static const BoxDecoration whiteRoundCurved = BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );
  static  BoxDecoration whiteRoundCurvfull = BoxDecoration(
    border: Border.all(color: Colors.white),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );
  static const BoxDecoration categoryButtonDecoration = BoxDecoration(
      gradient: Gradients.secondaryGradient2,
      boxShadow: [
        Shadows.secondaryShadow,
      ],
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    )
  );

  static const BoxDecoration halfButtonDecoration = BoxDecoration(
    color: AppColors.secondaryColor,
    boxShadow: [
      Shadows.secondaryShadow,
    ],
    borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0)),
  );



  static const BoxDecoration regularDecoration = BoxDecoration(
    color: Color.fromARGB(255, 255, 255, 255),
  );

  static BoxDecoration customRegularDecoration({
    Color color = const Color.fromARGB(255, 255, 255, 255),
  }) {
    return BoxDecoration(color: color);
  }

}
