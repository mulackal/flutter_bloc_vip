import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_template_vip/data/repository/iapp_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_template_vip/data/service/connectivity_service.dart';
import 'package:flutter/material.dart';

import 'cart_state.dart';
import 'package:flutter_template_vip/data/model/cart_responds.dart';

/*
 * Copyright (c) 2021, Vipin.
 */
class CartBloc extends Cubit<CartState> {

  final IAppRepository appRepository;


  CartBloc({@required this.appRepository}) : super(CartState.initial());


  Future<void> callCart(String token,int page) async {

    if(await ConnectivityService.isConnected()) {

      debugPrint("token--- loaded******  $token");

      try {

        if(page > 1)
          emit(state.dataWith(noNetwork: false,
              isFailure: false,
              loading: true,
              isShimmer: false,
              hideLoading: false,
              listSuccess:  false,));
        else
          emit(state.dataWith(noNetwork: false,
              isFailure: false,
              loading: false,
              isShimmer: true,
              hideLoading: false,
              listSuccess:  false,));


        Map<String, dynamic> payload = {
          "page":page,
          "limit":10
        };

        print("request: ${payload.toString()}");

        CartResponds responds = await appRepository.callCart(payload,token);

        if (responds != null) {

            if (page == 1) {
              emit(state.dataWith(noNetwork: false,
                  isFailure: false,
                  loading: false,
                  isShimmer: false,
                  cartList: responds.data,
                  listSuccess:  true,
                  errorMessage: "Success"));
            }
            else{
              List<CartData> data;
              if (state.cartList == null)
                data = [];
              else
                data = state.cartList;

              data.addAll(responds.data);

              emit(state.dataWith(noNetwork: false,
                  isFailure: false,
                  loading: false,
                  isShimmer: false,
                  cartList: data,
                  listSuccess:  true,
                  errorMessage: "Success"));
            }

          }else
            setStatevalues("Failed");

      } catch (e) {

        setStatevalues("Internal error");
      }

    }else{
      emit(state.dataWith(noNetwork: true,isFailure: false,  hideLoading: false,
        loading: false,  listSuccess:  false, isShimmer: false,));
      print("no internet");
    }

  }


  Future<void> setStatevalues(String msg) async{
    emit(state.dataWith( noNetwork: false,isFailure: true,  hideLoading: false, loading: false,
      listSuccess:  false, errorMessage: msg, isShimmer: false,));
}


}



