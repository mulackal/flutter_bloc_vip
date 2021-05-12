
import 'package:flutter/material.dart';
import 'package:flutter_template_vip/util/styles/app_colors.dart';
import 'package:flutter_template_vip/util/styles/app_text_styles.dart';

class CategoryCard extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final double opacity;
  final String imagePath;
  final Gradient gradient;
  final String category;
  final bool hasHandle;
  final Color handleColor;
  final GestureTapCallback onTap;

  CategoryCard(
      {this.width = 100,
       this.height = 100,
      this.borderRadius = 8,
      this.opacity = 0.65,
      this.imagePath,
      this.category = "",
      this.gradient,
      this.hasHandle = false,
      this.handleColor = AppColors.white,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(borderRadius)),
        child: Stack(
          children: <Widget>[
            Positioned(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: (imagePath != null &&imagePath.trim().isNotEmpty)
                    ? Image.network(imagePath,
                    width: width,
                    height: height,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CircularProgressIndicator(
                            backgroundColor: AppColors.white,
                            strokeWidth: 1.0,
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes
                                : null,
                          ),
                        ),
                      );
                    })
                    : Image.asset(
                  'assets/images/defualt_logo.png',
                  width: width,
                  height: height,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              child: Opacity(
                opacity: opacity,
                child: Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    gradient: gradient,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
              ),
            ),
            Positioned(
              top: hasHandle ?  (height / 3) : (height / 3) ,
              right: hasHandle ?5 : 2,
              left: hasHandle ? 5 : 2,
              child: hasHandle
                  ? Row(
                      children: <Widget>[
                        Spacer(flex: 1),
                        Text(
                          category,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.tinyTextStyleWhiteBold,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Spacer(flex: 1),
                        Container(
                          width: 1,
                          height: 30,
                          decoration: BoxDecoration(
                            color: handleColor,
                            borderRadius:
                                BorderRadius.circular(30),
                          ),
                        ),
                      ],
                    )
                  : Text(
                      category,
                      textAlign: TextAlign.center,
                style: AppTextStyles.tinyTextStyleWhiteBold,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                    ),
            )
          ],
        ),
      ),
    );
  }
}
