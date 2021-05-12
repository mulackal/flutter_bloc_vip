import 'dart:async';
import 'dart:convert';
import 'dart:developer';


import 'package:flutter_template_vip/data/model/login_responds.dart';

import 'package:flutter_template_vip/data/repository/iapp_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_template_vip/data/service/connectivity_service.dart';
import 'package:flutter_template_vip/util/device_info.dart';

import 'package:flutter_template_vip/util/validators.dart';
import 'package:flutter/material.dart';

import 'login_state.dart';

/*
 * Copyright (c) 2021, Vipin.
 */
class LoginBloc extends Cubit<LoginState> {

  final IAppRepository appRepository;

  var device_id = "";

  LoginBloc({@required this.appRepository}) : super(LoginState.initial());


  Future<void> callLogin(String push_token) async {

    if(await ConnectivityService.isConnected()) {

      try {

        Map<String, String> _deviceData = <String, String>{};
        _deviceData = await DeviceInfo.initPlatformState();

        device_id = _deviceData['device_id'];

        var device_info = json.encode(_deviceData);
        print("******device_info - $device_info");


        emit(state.dataWith(noNetwork: false,isFailure: false,
          isSubmitting: true,isSuccess: false,));

        var paramData = {
          'mobile' :state.mobile,
          "password": state.password,
          "device_token": push_token,
        };

        var parmas = jsonEncode(paramData);
        print("loginData - $parmas");

        LoginRespond responds = await appRepository.login(parmas);

        if (responds != null) {
          if(responds.data!=null) {
            emit(state.dataWith(noNetwork: false,
                isFailure: false,
                isSubmitting: false,
                isSuccess: true,
                loginData: responds.data,
                message: responds.message));
            print("loginData - ${responds.data.name}");
          }else
            setStatevalues("");
        }
        else
          setStatevalues("");


      } catch (e) {

        setStatevalues("Internal error");
      }
    }else{
      emit(state.dataWith( noNetwork: true,isFailure: false,
        isSubmitting: false,isSuccess: false));
      print("no internet");
    }

  }



  Future<void> setStatevalues(String msg) async{
    emit(state.dataWith( noNetwork: false,isFailure: true,message: msg,
      isSubmitting: false,isSuccess: false,));
}

  Future<void> setMobile(String mobile) async{
    emit(state.dataWith(mobile : mobile,
        noNetwork: false,isFailure: false,
        isSubmitting: false,isSuccess: false,
        ismobileValid: Validator.isValidMobile(mobile)));
  }

  Future<void> setPassword(String password) async{
    emit(state.dataWith(password : password,
        noNetwork: false,isFailure: false,
        isSubmitting: false,isSuccess: false,
        isPasswordValid: Validator.isValidText(password)));
  }


  Future<void> resetForm() async{
    emit(LoginState.initial());
  }


}



