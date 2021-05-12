
import 'package:flutter/material.dart';
import 'package:flutter_template_vip/util/screenSize_controller.dart';
import 'package:flutter_template_vip/util/screen_widgetsize_util.dart';
import 'package:flutter_template_vip/util/styles/app_colors.dart';

class AppLogo extends StatelessWidget {

  final String text;

  const AppLogo(this.text,);

  @override
  Widget build(BuildContext context) {
    return  Image.asset(
        'assets/images/user_avatar.png',
        color: AppColors.white,
        fit: BoxFit.contain,
        height: ScreenSizeWidgetUtil().setHightByScreenSize(
            ScreenSizeWidgetUtil().logo_hight),
        width: text == "mobile"
            ? ScreenSizeConfig.safeWidth
            : ScreenSizeConfig.safeWidth/2
    );
  }
}
