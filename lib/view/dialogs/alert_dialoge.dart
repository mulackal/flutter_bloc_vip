import 'dart:ui';
import 'package:flutter_template_vip/base/base_view.dart';

import 'package:flutter_template_vip/util/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AlertDialogBox extends StatefulWidget {
  final String type;
  final BaseView listener;

  const AlertDialogBox(
      {Key key,
      this.listener, this.type,})
      : super(key: key);

  @override
  _AlertDialogBoxState createState() => _AlertDialogBoxState();
}

class _AlertDialogBoxState extends State<AlertDialogBox> {
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
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          margin: EdgeInsets.only(top: 20.0),
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
              Text("LanguageKeys.alert",
                style: GoogleFonts.poppins(
                    color: AppColors.secondaryColor, fontSize: 18.0),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                widget.type =="delete" ? "LanguageKeys.delete_content":
                widget.type =="edit" ? "LanguageKeys.edit_content":
                "LanguageKeys.alert",
                style: GoogleFonts.poppins(
                  color: AppColors.font_color,
                  fontSize: 14.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                height: 70,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Expanded(
                      child: FlatButton(
                        child: Text(
                          "Yes",
                          style: GoogleFonts.josefinSans(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          widget.listener.logoutPopup(widget.type);
                        },
                      ),
                    ),

                    Expanded(
                      child: FlatButton(
                        child: Text(
                          "No",
                          style: GoogleFonts.josefinSans(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ],
    );
  }
}
