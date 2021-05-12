import 'package:flutter/material.dart';
/*
 * Copyright (c) 2021, Vipin.
 */
class ShimmerCard extends StatelessWidget {

  final Color _color;

  ShimmerCard(this._color,);

  @override
  Widget build(BuildContext context) {
  return  Container(
    padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 5.0,bottom: 5.0),
    child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      ClipOval(
    child: Container(
      width: 45.0,
      height: 45.0,
      color: _color,
    ),
        ),

      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 10.0,
              color: _color,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 3.0),
            ),
            Container(
              width: double.infinity,
              height: 10.0,
              color: _color,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 3.0),
            ),
            Container(
              width: 50.0,
              height: 10.0,
              color: _color,
            ),
          ],
        ),
      )
    ],
  ),
  );
  }
}