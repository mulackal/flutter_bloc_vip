import 'package:flutter/material.dart';
import 'package:flutter_template_vip/util/styles/app_colors.dart';
import 'package:flutter_template_vip/util/styles/app_text_styles.dart';
import 'package:flutter_template_vip/widgets/values/decorations.dart';
/*
 * Copyright (c) 2021, Vipin.
 */
class NormalFlatButton extends StatelessWidget {


  final String text;
  final Function fn;


  NormalFlatButton(this.text,this.fn);

  @override
  Widget build(BuildContext context) {
  return  GestureDetector(
    onTap: (){ fn(); },
    child: Container(
      height: 50,
      child: Card(
        shape: Decorations.cardSqurBackgrund,
        color: AppColors.secondaryColor,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(10,0,10,0),
          child: Text(
            text,
            style: AppTextStyles.mediumTextStyleWhite,
          ),
        ),
      ),
    ),
  );
  }
}