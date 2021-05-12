/*
 * Copyright (c) 2021, Vipin.
 */

import 'package:flutter_template_vip/bloc/common/common_bloc.dart';
import 'package:flutter_template_vip/base/base_page.dart';
import 'package:flutter_template_vip/bloc/login/login_bloc.dart';
import 'package:flutter_template_vip/bloc/login/login_state.dart';

import 'package:flutter_template_vip/data/service/constants.dart';
import 'package:flutter_template_vip/util/common_util.dart';

import 'package:flutter_template_vip/util/my_navigator.dart';
import 'package:flutter_template_vip/util/resource_string.dart';
import 'package:flutter_template_vip/util/screenSize_controller.dart';


import 'package:flutter_template_vip/util/styles/app_colors.dart';
import 'package:flutter_template_vip/util/styles/app_text_styles.dart';
import 'package:flutter_template_vip/view/cart/mycart_page.dart';


import 'package:flutter_template_vip/widgets/commonButtonCurved.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends BasePage {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends BasePageState<LoginForm> {
  LoginBloc _loginBloc;

  var ctrl_txt_mobile = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var ctrl_txt_password = TextEditingController();
  bool _ispassObscure = true;
  final focuspassword = FocusNode();

  @override
  void initState() {
    super.initState();

     _loginBloc = BlocProvider.of<LoginBloc>(context);
      ctrl_txt_mobile.addListener(_onPhoneChanged);
      ctrl_txt_password.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: _loginBloc,
      builder: (context, state) {
        if (state.isSuccess) {
          hideLoadingDialoge();

          if(state.loginData!=null) {
            print("loginData - verifyData");
            if(state.loginData.apiToken !=null && state.loginData.apiToken.trim().isNotEmpty) {
              print("loginData - apiToken");
              sessionValues.setStringSesssion(
                  SharedPrefKeys.token, state.loginData.apiToken);
              sessionValues.setStringSesssion(
                  SharedPrefKeys.mobile, state.loginData.mobile);
              sessionValues.setStringSesssion(
                  SharedPrefKeys.username, state.loginData.name);
              sessionValues.setStringSesssion(
                  SharedPrefKeys.email, state.loginData.email);

              BlocProvider.of<CommonBloc>(context).setUserinfo(state.loginData.name,
                  state.loginData.email,state.loginData.mobile);

              if(state.loginData.media!=null && state.loginData.media.isNotEmpty) {
                sessionValues.setStringSesssion(
                    SharedPrefKeys.profilePic, state.loginData.media[0].thumb);
                BlocProvider.of<CommonBloc>(context).setProfilePic(state.loginData.media[0].thumb);
              }
              else {
                sessionValues.setStringSesssion(
                    SharedPrefKeys.profilePic, "");
                BlocProvider.of<CommonBloc>(context).setProfilePic("");
              }

              sessionValues.setBoolSesssion(SharedPrefKeys.loggedIn, true);

              _loginBloc.resetForm();

              Future.delayed(Duration.zero, () {
                MyNavigator.goToNextPage(context, MyCartPage.routeName);
              });

            }
          }

        } else if (state.noNetwork) {
          showToast(ResourceString().getString("no_network"));
        } else if (state.isSubmitting) {
          showLoadingDialoge();
        } else if (state.isFailure) {
          hideLoadingDialoge();
          if (state.errorMessage != null && state.errorMessage.isNotEmpty)
            showToast(state.errorMessage);
          else
            showToast(ResourceString().getString("server_error"));
        }
        return Container(
                    child: GestureDetector(
                        onTap: () {
                          CommonUtil().keyboardHide(context);
                        },
                        child: bodyPart()));

      },
    );
  }

  Widget bodyPart() {
    return Stack(
      children: [
        Container(
          color:AppColors.white_gray,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.only(top:5.0),
              height: ScreenSizeConfig.safeHeight /3,
              width: MediaQuery.of(context).size.width ,
              child: Center(
                child: Image.asset(
                  'assets/images/user_avatar.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: ScreenSizeConfig.safeHeight/1.5,
              width: MediaQuery.of(context).size.width,
              decoration: new BoxDecoration(
                  color: AppColors.white,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(40.0),
                    topRight: const Radius.circular(40.0),
                  )),

              child: mobileUi(),

            ))
      ],
    );
  }

  Widget mobileUi() {
    return Padding(
          padding: EdgeInsets.fromLTRB(25.0, 10.0, 20.0, 15.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20),

            textBinder(
                "Sign In", AppTextStyles.toplargeTextStyleBlackBold),
            SizedBox(height: 25),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  textBinder("Mobile Number",AppTextStyles.mediumTextStyleBlack),


                 _getEmailEditTextView(),

                  Container(color: AppColors.gray,height: 0.5, width: double.infinity,),

                  SizedBox(height: 10.0),

                  textBinder("Password",AppTextStyles.mediumTextStyleBlack),

                  _getPassWordEdittext(
                      ctrl_txt_password,
                      "Password",
                      "Please fill in a valid password",),

                  Container(color: AppColors.gray,height: 0.5, width: double.infinity,),


                  SizedBox(height: 15.0,),

                  forgetPassword("mobile"),

                  Padding(
                    padding: const EdgeInsets.only(top:10,left: 20.0,right :20),
                    child: CommonButtonCurved(
                        text: "Sign In",
                        fn: LoginAction,
                        color: AppColors.mainColor,
                        textcolor: AppColors.white,
                        curving: true),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),

                  signUp(""),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget forgetPassword(String type) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () { },
        child: Text(
          "Forgot Password?",
          style: AppTextStyles.mediumTextStyleBlack,
        ),
      ),
    );
  }

  Text textBinder(String key, TextStyle style) {
    return Text(
      key,
      style: style,
    );
  }
  Widget signUp(String type) {
    return Padding(
      padding:  const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Not yet registered?",
            style: AppTextStyles.mediumTextStyleBlack,
          ),
          SizedBox(
            width: 5.0,
          ),
          GestureDetector(
            onTap: () { },
            child: Text(
              "Sign Up",
              style: AppTextStyles.mediumTextStyleBlackBold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getPassWordEdittext(TextEditingController ctrl_txt, String hint,
      String error) {
    return Container(
      height: 35,
      child: TextFormField(
        obscureText: _ispassObscure,
        focusNode: focuspassword,
        cursorHeight: 20,
        controller: ctrl_txt_password,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 20),
          border: InputBorder.none,
          hintStyle: AppTextStyles.semilargeTextStyleBlack,
            suffixIcon: IconButton(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              icon: Icon(
                _ispassObscure ? Icons.visibility : Icons.visibility_off,
                color: AppColors.gray,
              ),
              onPressed: () {
                setState(() {
                  _ispassObscure = !_ispassObscure;
                });
              },
            ),
        ),
        keyboardType: TextInputType.text,
        // password format
        maxLines: 1,
        style: AppTextStyles.semilargeTextStyleBlack,
        cursorColor: AppColors.secondaryLight,
        textInputAction: TextInputAction.done,
        onFieldSubmitted: (v) {
          LoginAction();
        },
       /* autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          return _loginBloc.state.isPasswordValid ? null : error;
        },*/
        onChanged: (String text) {
          print("password : " + text);
        },
      ),
    );
  }

  Widget _getEmailEditTextView() {
    return Container(
      height: 35,
      child: TextFormField(
        controller: ctrl_txt_mobile,
        cursorHeight: 20,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(0, 0, 0,12),
          border: InputBorder.none,
          hintStyle: AppTextStyles.semilargeTextStyleBlack,
        ),
        keyboardType: TextInputType.number,
        maxLines: 1,
        style: AppTextStyles.semilargeTextStyleBlack,
        cursorColor: AppColors.secondaryLight,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(focuspassword);
        },
      /*  autovalidateMode: AutovalidateMode.onUserInteraction,
         validator: (value) {
          return _loginBloc.state.ismobileValid ? null : "Please fill in a valid mobile";
        },*/
        onChanged: (String text) {
          print("mobile : " + text);
        },
      ),
    );
  }


  @override
  void dispose() {
    ctrl_txt_mobile.dispose();
    focuspassword.dispose();
    ctrl_txt_password.dispose();
    super.dispose();
  }

  void _onPhoneChanged() {
     _loginBloc.setMobile(ctrl_txt_mobile.text);
  }
  void _onPasswordChanged() {
    _loginBloc.setPassword(ctrl_txt_password.text);
  }

  LoginAction() {

    CommonUtil().keyboardHide(context);

    MyNavigator.goToNextPage(context, MyCartPage.routeName);

     /*if (_loginBloc.state.ismobileValid) {
       if (_loginBloc.state.isPasswordValid) {
      _loginBloc.callLogin(sessionValues.getStringSession(SharedPrefKeys.push_token) ?? "");
       } else {
         showToast("Please fill in a valid password");
       }
       } else {
     showToast("Please fill in a valid mobile");
    }*/


  }


}
