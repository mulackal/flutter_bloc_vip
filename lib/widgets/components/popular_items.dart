import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_vip/util/resource_string.dart';
import 'package:flutter_template_vip/util/styles/app_colors.dart';
import 'package:flutter_template_vip/util/styles/app_text_styles.dart';

class PopularFoodTiles extends StatelessWidget {
  String name;
  String imageUrl;
  String rating;
  String p_time;
  String price;
  bool favariote;
  bool chef_favariote;

  PopularFoodTiles(
      {Key key,
        @required this.name,
        @required this.imageUrl,
        @required this.rating,
        @required this.p_time,
        @required this.price,
        @required this.favariote,
        @required this.chef_favariote})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 0, right: 5, top: 5, bottom: 5),
            decoration: BoxDecoration(boxShadow: []),
            child: Card(
                color: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                child: Container(
                  width: 180,
                  height: 180,
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              alignment: Alignment.topRight,
                              width: double.infinity,
                              padding: EdgeInsets.only(right: 5, top: 5),
                              child: Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFFfae3e2),
                                        blurRadius: 25.0,
                                        offset: Offset(0.0, 0.75),
                                      ),
                                    ]),
                                child: Icon(
                                  favariote? Icons.favorite : Icons.favorite_border,
                                  color: favariote? AppColors.red : AppColors.gray,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),

                          if(chef_favariote)
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: const EdgeInsets.only(top:10.0,left: 10),
                                child: Image.asset(
                                  'assets/images/chefme.png',
                                  width: 25,
                                  height: 25,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                          Padding(
                            padding: const EdgeInsets.only(top:5.0),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: ClipOval(
                                child: (imageUrl != null &&imageUrl.trim().isNotEmpty)
                                    ? Image.network(imageUrl,
                                    width: 120,
                                    height: 120,
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
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.contain,
                                ),
                              )
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 175,
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(left: 10, top: 5,right: 1),
                            child: Text('$name',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: AppTextStyles.mediumTextStyleBlackBold),
                          ),


                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.only(left: 10, top: 5),
                                child: Text(rating,
                                    style: AppTextStyles.tinyTextStyleGray),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 3, left: 1),
                                child: Icon(
                                      Icons.star,
                                      size: 10,
                                      color: AppColors.secondaryColor,
                                    ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.only(left: 3, top: 5),
                                child: Row(
                                  children: [

                                    Container(width: 1,height: 10,color: AppColors.gray,),

                                    SizedBox(width: 5,),
                                    Text((p_time !=null && p_time!= 'null') ? "$p_time mins" : '0 mins',
                                        style:  AppTextStyles.tinyTextStyleGray),
                                    Icon(
                                      Icons.timer,
                                      size: 10,
                                      color: AppColors.tiny_gray,
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(left: 3, top: 5, right: 8),
                            child: Text('${ResourceString().getString("inr")} ' + price,
                                style:  AppTextStyles.mediumTextStyleInr),
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}