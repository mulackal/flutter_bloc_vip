import 'package:flutter/material.dart';
import 'package:flutter_template_vip/util/styles/app_text_styles.dart';


class HeadingRow extends StatelessWidget {
  final String title;
  final String number;
  final GestureTapCallback onTapOfNumber;

  HeadingRow({this.title, this.number, this.onTapOfNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.left,
            style: AppTextStyles.semilargeTextStyleBlackBold
          ),
          InkWell(
            onTap: onTapOfNumber,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                number,
                textAlign: TextAlign.right,
                style:AppTextStyles.mediumSemiTextStyleGray
              ),
            ),
          ),
        ],
      ),
    );
  }
}
