/*
 * Copyright (c) 2021, Vipin.
 */

import 'dart:async';
import 'dart:developer';

import 'package:flutter_template_vip/base/base_page.dart';
import 'package:flutter_template_vip/bloc/login/login_bloc.dart';
import 'package:flutter_template_vip/bloc/login/login_state.dart';


import 'package:flutter_template_vip/data/repository/iapp_repository.dart';
import 'package:flutter_template_vip/data/service/constants.dart';
import 'package:flutter_template_vip/util/common_util.dart';

import 'package:flutter_template_vip/util/my_navigator.dart';
import 'package:flutter_template_vip/util/resource_string.dart';
import 'package:flutter_template_vip/util/screenSize_controller.dart';
import 'package:flutter_template_vip/util/screen_argument.dart';


import 'package:flutter_template_vip/util/styles/app_colors.dart';

import 'package:flutter_template_vip/widgets/components/toolbar_back.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webpage extends BasePage {
  static const routeName = '/web-page';

  @override
  _WebpageState createState() => new _WebpageState();
}

class _WebpageState extends BasePageState<Webpage> {


  final _key = UniqueKey();
  String url = "";
  String from = "";
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    showLoadingDialoge();
  }

  @override
  Widget build(BuildContext context) {

    ScreenArguments args = ModalRoute.of(context).settings.arguments;
    url = args.userType;
    from = args.from;


    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.secondaryColor,
          toolbarHeight: 0,
        ),
        body: SafeArea(
          top: true,
          bottom: true,
          child: web_stack()
        ));
  }



  Widget web_stack() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: ToolbarBack(
              from,
              goBack,
              1,
              AppColors.transparent),
        ),


        Expanded(
           child: WebView(
            key: _key,
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (webViewCreate) {
              _controller.complete(webViewCreate);
            },
            onPageFinished: (finish) {
              setState(() {
               // _isLoadingPage = false;
                hideLoadingDialoge();
              });
            },
          ),
        ),
      ],
    );
  }
  void goBack() {
    MyNavigator.popUp(context);
  }

  @override
  void dispose() {
    _controller =null;
    super.dispose();
  }
}
