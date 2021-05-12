import 'package:flutter/material.dart';
/*
 * Copyright (c) 2021, Vipin.
 */
class GradientBackground extends StatelessWidget {

  final Color _start;
  final Color _end;

  GradientBackground(this._start,this._end);

  @override
  Widget build(BuildContext context) {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          _start,
          _start,
          _start,
          _end,
        ],
      ),
    ),
  );
  }
}