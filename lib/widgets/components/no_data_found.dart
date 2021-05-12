import 'package:flutter_template_vip/util/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_vip/util/styles/app_colors.dart';

class NodataUI extends StatelessWidget {

  final String text;

  const NodataUI(this.text,);

  @override
  Widget build(BuildContext context) {
    return   Container(
      color: AppColors.home_bg,
      child: Center(child: Text(
        text,
        style: AppTextStyles.mediumTextStyleBlack ,
      ),),
    );
  }
}
