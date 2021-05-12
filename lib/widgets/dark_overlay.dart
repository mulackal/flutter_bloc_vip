import 'package:flutter/material.dart';

class DarkOverLay extends StatelessWidget {
  final Gradient gradient;
  final double height;
  final double width;

  DarkOverLay({
   this.gradient = const LinearGradient(
  begin: Alignment(0.51436, 1.07565),
  end: Alignment(0.51436, -0.03208),
  colors: <Color>[
  Color.fromARGB(255, 0, 0, 0),
  Color.fromARGB(255, 8, 8, 8),
  Color.fromARGB(105, 45, 45, 45),
  ],
  stops: const <double>[
  0.0,
  0.35,
  0.5,
  0.65,
  1.0
  ]),
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Positioned(
      width: this.width ?? width,
      height: height,
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: gradient,
        ),
        child: Container(),
      ),
    );
  }
}
