


import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_vip/data/model/cart_responds.dart';


class CartState extends Equatable {

  final bool listSuccess;
  final bool isFailure;
  final bool noNetwork;
  final bool loading;
  final bool hideLoading;
  final String errorMessage;
  final List<CartData> cartList;
  final bool isShimmer;

  const CartState({
    @required this.listSuccess,
    @required this.cartList,
    @required this.isFailure,
    @required this.noNetwork,
    @required this.errorMessage,
    @required this.loading,
    @required this.isShimmer,
    @required this.hideLoading,
  });

  factory CartState.initial() {
    return CartState(
      noNetwork: false,
      cartList: null,
      isFailure: false,
      hideLoading:  false,
      loading:  false,
        isShimmer: false,
      listSuccess:  false,
      errorMessage: '',
    );
  }


  CartState dataWith({
     bool listSuccess,
     bool isFailure,
     bool isShimmer,
     bool noNetwork,
     String errorMessage,
    List<CartData> cartList,
     bool loading,
     bool hideLoading,
  }) {
    return CartState(
      listSuccess:  listSuccess ?? this.listSuccess,
      isShimmer: isShimmer ?? this.isShimmer,
      cartList:  cartList ?? this.cartList,
      loading: loading ?? this.loading,
      hideLoading: hideLoading ?? this.hideLoading,
      isFailure: isFailure ?? this.isFailure,
      noNetwork: noNetwork ?? this.noNetwork,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props =>
      [
        isShimmer,
        cartList,
        listSuccess,
         isFailure,
         noNetwork,
         errorMessage,
        loading,
        hideLoading,
      ];

  @override
  String toString() {
    return '''MyFormState {
      message : $errorMessage,
    }''';
  }
}
