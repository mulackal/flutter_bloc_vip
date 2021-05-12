import 'dart:ui';
import 'package:flutter_template_vip/base/base_view.dart';
import 'package:flutter_template_vip/util/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_template_vip/util/styles/app_text_styles.dart';

class LogoutDialogBox extends StatefulWidget {
  final String title, descriptions, text;
  final Image img;
  final BaseView listener;

  const LogoutDialogBox(
      {Key key,
      this.listener,
      this.title,
      this.descriptions,
      this.text,
      this.img})
      : super(key: key);

  @override
  _LogoutDialogBoxState createState() => _LogoutDialogBoxState();
}

class _LogoutDialogBoxState extends State<LogoutDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
          margin: EdgeInsets.only(top: 40.0),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                    color: AppColors.homecard_bg,
                    offset: Offset(0, 3),
                    blurRadius: 5),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                "Logout",
                style: AppTextStyles.semilargeTextStyleBlackBold,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Are you sure you want to logout?",
                style: AppTextStyles.mediumTextStyleBlack,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),

              Row(children: [
                Expanded(
                  child: FlatButton(
                    child: Text(
                      "Yes",
                      style: AppTextStyles.mediumTextStyleBlackBold,
                    ),
                    onPressed: () {
                      /** logout code**/
                      Navigator.of(context).pop();
                      widget.listener.logoutPopup("yes");
                    },
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    child: Text(
                      "No",
                      style:   AppTextStyles.mediumTextStyleBlackBold,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],),

            ],
          ),
        ),
        Positioned(
          left: 20.0,
          right: 20.0,
          top: 5,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 35.0,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                child: Image.asset("assets/images/app_logo.png")),
          ),
        ),
      ],
    );
  }
}
