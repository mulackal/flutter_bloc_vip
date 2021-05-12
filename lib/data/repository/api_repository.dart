
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_template_vip/data/model/cart_responds.dart';
import 'dart:developer';
import 'package:flutter_template_vip/data/service/constants.dart' show NetworkKeys;
import 'package:flutter_template_vip/util/logger.dart';
import 'iapp_repository.dart';
import 'package:flutter_template_vip/data/service/api_service.dart';
import 'package:flutter_template_vip/data/model/login_responds.dart';


/*
 * Copyright (c) 2021, Vipin.
 */
class AppRepository implements IAppRepository {

  final _apiService = ApiService();



  @override
  Future<LoginRespond> login(String datas) async {
    try {

      Response response = await _apiService.dio.post(NetworkKeys.mainlogin,
          data: datas,
          options: Options(contentType: 'application/json'));


      if(response.statusCode == 200) {
        Logger("LoginRespond***true*****").log(response.toString());
        final LoginRespond _datas = loginFromJson(response.toString());
        Logger("LoginRespond********").log(_datas.message);

        return _datas;

      }else
        return LoginRespond.withError("");

    } catch (error, stacktrace) {
      Logger("LoginRespond***error*****").log(error.toString());
      return LoginRespond.withError("");
    }
  }


  @override
  Future<CartResponds> callCart(Map<String, dynamic> payload,String token) async {
    try {

      Response response = await _apiService.dio.get(NetworkKeys.cart,
          queryParameters: payload,
          options: Options(contentType: 'application/json',));

       // headers: {"Authorization": "Bearer "+token,}

      if(response.statusCode == 200) {

       // final Map responseBody = json.decode(response.data);

        final CartResponds _datas =  cartFromJson(response.toString());

        Logger("callCart********").log(response.toString());

        return _datas;

      }

    } catch (error, stacktrace) {
      Logger("callCart***error*****").log(error.toString());
    }
  }


}
