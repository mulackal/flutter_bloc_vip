import 'package:flutter_template_vip/base/base_view.dart';
import 'package:flutter_template_vip/data/service/constants.dart';
import 'package:flutter_template_vip/util/styles/app_colors.dart';
import 'package:flutter_template_vip/util/styles/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WarningDialog extends StatelessWidget {
  final BaseView _listener;

  WarningDialog(
    this._listener,
  );

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      elevation: 6.0,
      title: Text(
        "AlertDialog",
        style: GoogleFonts.josefinSans(color: AppColors.secondaryColor),
      ),
      actions: <Widget>[
        new TextButton(
          child: Text(
            "yes",
            style: GoogleFonts.josefinSans(
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {

          },
        ),
         TextButton(
          child: Text(
           "no",
            style: GoogleFonts.josefinSans(
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
      content: Text(
        "Content",
        style: GoogleFonts.josefinSans(color: AppColors.font_color),
      ),
    );
  }
}
