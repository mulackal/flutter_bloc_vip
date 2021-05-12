import 'dart:io';
import 'package:flutter_template_vip/util/my_navigator.dart';
import 'package:flutter_template_vip/util/screenSize_controller.dart';
import 'package:flutter_template_vip/util/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_vip/widgets/values/decorations.dart';
import 'package:flutter_template_vip/util/styles/app_colors.dart';
class ToolbarBack extends StatelessWidget {

  final String text;
  final int align;
  final Function fn;
  final Color bg;

  const ToolbarBack(this.text, this.fn,this.align,this.bg);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bg,
      height:  Platform.isIOS ? 60 : 55,
      child: Padding(
        padding: const EdgeInsets.only(left: 1.0,right: 10.0,top: 0.0,bottom: 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            GestureDetector(
              onTap: () {
              MyNavigator.popUp(context);
              },
              child: Card(
                elevation: 3,
                child: Container(
                    height: 33,
                    width: 33,
                    decoration: Decorations.whiteSideCurved,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(8,0.0,0.0,0.0),
                      child: Icon(Icons.arrow_back_ios,
                          color: AppColors.light_gray,
                          size: 20.0),

                    )),
              ),
            ),

          SizedBox(width: 10,),
          Expanded(child:
            Text(text, textAlign: align == 0 ?
               TextAlign.center: TextAlign.start,
               style: AppTextStyles.largeTextStyleBlackBold,),
            ),
          ],
        ),
      )
    );
  }
}