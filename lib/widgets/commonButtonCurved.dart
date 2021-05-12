import 'package:flutter_template_vip/util/screenSize_controller.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
/*
 * Copyright (c) 2021, Vipin.
 */
class CommonButtonCurved extends StatefulWidget {

  final String text;
  final Function fn;
  final Color color;
  final Color textcolor;
  final bool curving;
  CommonButtonCurved({ Key key, this.text,this.fn, this.color,this.textcolor,this.curving}) : super(key: key);

  @override
  _CommonButtonCurvedState createState() => _CommonButtonCurvedState();
}

class _CommonButtonCurvedState extends State<CommonButtonCurved>with
    SingleTickerProviderStateMixin {

  double _scale;
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 600,
      ),
      lowerBound: 0.0,
      upperBound: 0.2,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
      height: ScreenSizeConfig.orientation ? 45: 55,
      margin: const EdgeInsets.fromLTRB(0.0,10.0,0.0,10.0),
      child: Container(
       // onPressed: widget.fn,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: widget.curving? BorderRadius.all(Radius.circular(30.0))
          : BorderRadius.all(Radius.circular(8.0)),
            color: widget.color,
        ),

          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style:  GoogleFonts.poppins(fontSize: 14, color: widget.textcolor),),

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