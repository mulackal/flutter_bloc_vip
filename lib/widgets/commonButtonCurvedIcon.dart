import 'package:flutter_template_vip/util/screenSize_controller.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_template_vip/util/styles/app_text_styles.dart';
/*
 * Copyright (c) 2021, Vipin.
 */
class CommonButtonCurvedIcon extends StatefulWidget {

  final String text;
  final Function fn;
  final Color color;
  final Color textcolor;
  final IconData icon;

  CommonButtonCurvedIcon({ Key key, this.text,this.fn, this.color,this.textcolor,this.icon}) : super(key: key);

  @override
  _CommonButtonCurvedIconState createState() => _CommonButtonCurvedIconState();
}

class _CommonButtonCurvedIconState extends State<CommonButtonCurvedIcon>with
    SingleTickerProviderStateMixin {

  double _scale;
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
  return GestureDetector(
    onTapDown: _tapDown,
    onTap:  widget.fn,
    onTapUp: _tapUp,
    child: Transform.scale(
      scale: _scale,
      child: Container(
      height: ScreenSizeConfig.orientation ? 35: 45,
      margin: EdgeInsets.fromLTRB(0.0,10.0,0.0,10.0),
      child: Container(
       // onPressed: widget.fn,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: widget.color,
        ),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.text,
                textAlign: TextAlign.center,
                style:  AppTextStyles.mediumTextStyleGreen,),

              SizedBox(width: ScreenSizeConfig.orientation? 8.0:12,),

              Icon(widget.icon,color: widget.textcolor,size: 17,),

            ],
          ),

      ),
    ),
  ),
  );
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }
  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }

}