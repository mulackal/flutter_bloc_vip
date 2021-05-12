
/*
 * Copyright (c) 2021, Vipin.
 */
import 'package:dio/dio.dart';
import 'package:flutter_template_vip/util/logging_interceptor.dart';
import 'package:flutter_template_vip/data/service/constants.dart' show NetworkKeys;

class ApiService {
  ApiService._internal() {
    dio = new Dio();
    dio.options
      ..baseUrl = NetworkKeys.base_url
      ..connectTimeout = 100000
      ..receiveTimeout =  100000;
    dio.interceptors.add(LoggingInterceptor());
  }

  Dio dio;

  static final ApiService _instance = ApiService._internal();

  factory ApiService() {
    return _instance;
  }
}
