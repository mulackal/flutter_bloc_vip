import 'package:flutter_template_vip/base/base_page.dart';
import 'package:flutter_template_vip/data/model/cart_responds.dart';
import 'package:flutter_template_vip/widgets/components/toolbar_back.dart';


import 'package:flutter_template_vip/util/common_util.dart';
import 'package:flutter_template_vip/widgets/values/decorations.dart';
import 'package:flutter_template_vip/data/repository/iapp_repository.dart';
import 'package:flutter_template_vip/bloc/cart/cart_bloc.dart';
import 'package:flutter_template_vip/bloc/cart/cart_state.dart';
import 'package:flutter_template_vip/util/my_navigator.dart';
import 'package:flutter_template_vip/util/resource_string.dart';
import 'package:flutter_template_vip/util/screenSize_controller.dart';

import 'package:flutter_template_vip/util/styles/app_colors.dart';
import 'package:flutter_template_vip/util/styles/app_text_styles.dart';
import 'package:flutter_template_vip/util/styles/shimmer_effect.dart';
import 'package:flutter_template_vip/widgets/components/no_data_found.dart';
import 'package:flutter_template_vip/widgets/components/toolbar_back.dart';
import 'package:flutter_template_vip/data/service/constants.dart';
import 'package:flutter_template_vip/widgets/shimmer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyCartPage extends BasePage {
  static const routeName = '/my-cart';

  @override
  _MyCartPageState createState() => _MyCartPageState();
}

class _MyCartPageState extends BasePageState<MyCartPage> {

  CartBloc _cartBloc;
  int pageCount = 1;
  ScrollController controller;

  @override
  void initState() {
    super.initState();

    controller = new ScrollController()..addListener(_scrollListener);

    _cartBloc = CartBloc(
        appRepository: RepositoryProvider.of<IAppRepository>(context));

      getCartview(pageCount);
  }

  void getCartview(int count) {
    Future.delayed(Duration.zero, () {
      _cartBloc.callCart(sessionValues.getStringSession(SharedPrefKeys.token), count);
    });
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }


  void _scrollListener() {
    print("listpaging1: ${controller.position.extentAfter}");
    print("listpaging2: ${controller.position.maxScrollExtent}");
    print("listpaging3: ${controller.position.pixels}");

    if (controller.position.maxScrollExtent ==
        controller.position.pixels) {
      pageCount = pageCount + 1;
      getCartview(pageCount);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: BlocConsumer(
          bloc:  _cartBloc,
          listener: (BuildContext context, CartState state) {
            if (state.listSuccess) {
              if(pageCount>1)
              hideLoadingDialoge();
            }
            if (state.noNetwork) {
              showToast(ResourceString().getString("no_network"));
            } else if (state.loading) {
              showLoadingDialoge();
            } else if (state.isFailure) {
              if(pageCount>1)
              hideLoadingDialoge();
              if (state.errorMessage != null && state.errorMessage.isNotEmpty)
                showToast(state.errorMessage);
              else
                showToast(ResourceString().getString("server_error"));
            }
          },
          builder: (BuildContext context, CartState state) {
            return GestureDetector(
              onTap: () {
                CommonUtil().keyboardHide(context);
              },
              child: uiView(state),
            );
          },
        ),
      ),
    );
  }

  Widget uiView(CartState state) {
    return Container(
      color: AppColors.home_bg,
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ToolbarBack("Your Basket",goBack,1,AppColors.home_bg),

            SizedBox(
              height: 15,
            ),

            Expanded(child: reviewLister(state)),
          ],
        ),
      ),
    );
  }


  Widget whiteBar(bool isbottom) {
    return Container(
      margin: isbottom? EdgeInsets.only(left: 0, right: 0, bottom: 10, top: 15):
      EdgeInsets.only(left: 30, right: 30, bottom: 0, top: 15),
      color: AppColors.white,
      height: 0.8,
    );
  }


  Widget reviewLister(CartState state) {
    return state.isShimmer
        ? Container(
      child: Shimmer.fromColors(
        baseColor: AppColors.shimmer_base,
        highlightColor: AppColors.shimmer_gihlite,
        enabled: state.isShimmer,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return ShimmerCard(AppColors.gray);
          },
        ),
      ),
    )
        : (state.cartList == null || state.cartList.isEmpty)
        ? NodataUI("")
        : ListView.builder(
        controller: controller,
        shrinkWrap: false,
        itemCount: state.cartList.length,
        itemBuilder: (BuildContext context, int index) {
          return reviewList(state.cartList[index]);
        },
      );
  }


  Widget reviewList(CartData cartData) {
        return   Container(
            padding: EdgeInsets.only(left: 0, right: 0,),
            child: Card(
                color: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.only(left: 2, ),
                  width: ScreenSizeConfig.screenWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: (cartData.avatar != null &&cartData.avatar.isNotEmpty)
                                ? Image.network(cartData.avatar,
                                width: 100,
                                height: 70,
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context, Widget child,
                                    ImageChunkEvent loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: CircularProgressIndicator(
                                        backgroundColor: AppColors.mainColor,
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
                              'assets/images/user_avatar.png',
                              width: 100,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            margin: const EdgeInsets.only(top: 5, bottom: 5,),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Container(
                                  height: 30,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Container(
                                        width: ScreenSizeConfig.screenWidth/3.2,
                                        child: Text(
                                         '${cartData.firstName}',
                                         style: AppTextStyles.mediumTextStyleBlack,
                                         textAlign: TextAlign.start,
                                        maxLines: 1,
                                        overflow:TextOverflow.ellipsis,),
                                      ),

                                      Container(
                                        margin: const EdgeInsets.only(left: 1, right: 1,),
                                        height: 30,
                                        child: Card(
                                          shape: Decorations.cardSqurBorder,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: (){},
                                                child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  margin: const EdgeInsets.only(left: 5, right: 5,),
                                                  child: Icon(Icons.remove,
                                                      color: AppColors.secondaryColor, size: 15.0),
                                                ),
                                              ),
                                              Text('1',style: AppTextStyles.mediumTextStyleBlack,),
                                              GestureDetector(
                                                onTap: (){},
                                                child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  margin: const EdgeInsets.only(left: 5, right: 5,),
                                                  child: Icon(Icons.add,
                                                      color: AppColors.secondaryColor, size: 15.0),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),


                                Container(
                                  child:  Text(
                                    '${ResourceString().getString("inr")} ${cartData.id}',
                                    style: AppTextStyles.mediumTextStyleInr,
                                    textAlign: TextAlign.start,
                                  ),
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(),
                                    Container(
                                      width: ScreenSizeConfig.screenWidth/1.8,
                                      margin: const EdgeInsets.only(right: 10),
                                      child:  Text(
                                        '${cartData.email}',
                                        style: AppTextStyles.mediumTextStyleBlackBoldInr,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height:2),

                              ],
                            ),
                          ),

                        ],
                      ),

                      SizedBox(height:5),

                    ],
                  ),
                )));

  }

  Widget textBinder(String text, TextStyle stles, TextAlign pos, bool padding) {
    return Padding(
      padding: padding
          ? const EdgeInsets.only(left: 30.0, right: 30)
          : const EdgeInsets.all(0),
      child: Text(
        text,
        style: stles,
        textAlign: pos,
      ),
    );
  }


  Widget dialoge(){
    return AlertDialog(
      title: const Text("Delete Confirmation"),
      content: const Text("Are you sure you want to delete this item?"),
      actions: <Widget>[
        TextButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: const Text("Delete")
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel"),
        ),
      ],
    );
  }

  void goBack() {
    MyNavigator.popUp(context);
  }


  void LoginAction() {

  }
}
