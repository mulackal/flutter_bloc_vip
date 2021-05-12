
import 'package:flutter_template_vip/bloc/login/login_bloc.dart';
import 'package:flutter_template_vip/data/repository/iapp_repository.dart';
import 'package:flutter_template_vip/bloc/common/common_bloc.dart';
import 'package:flutter_template_vip/util/styles/app_colors.dart';
import 'package:flutter_template_vip/base/base_page.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_form.dart';


class LoginPages extends BasePage {

  static const routeName = '/login';

  @override
  _LoginPagesState createState() => new _LoginPagesState();
}

class _LoginPagesState extends BasePageState<LoginPages>{


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
       // backgroundColor: AppColors.white,
        body: SafeArea(
        top: true,
        bottom: true,
        child:  BlocProvider(
          create: (context) => LoginBloc( appRepository:
            RepositoryProvider.of<IAppRepository>(context),),
          child: LoginForm(),
    ),
      ));
  }
}

