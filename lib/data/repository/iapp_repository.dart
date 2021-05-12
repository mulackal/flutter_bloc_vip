import 'dart:async';


import 'package:flutter_template_vip/data/model/cart_responds.dart';
import 'package:flutter_template_vip/data/model/login_responds.dart';

import 'base_repository.dart';


abstract class IAppRepository extends IBaseRepository{

  Future<LoginRespond> login(String data);
  Future<CartResponds> callCart(Map<String, dynamic> payload,String token);

}
