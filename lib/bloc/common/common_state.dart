

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class CommonState extends Equatable {
  final int notification_count;
  final bool isRefresh;
  final String profilePic;
  final String addressInfo;
  final String name;
  final String mobile;
  final String email;
  final bool fromSplash;
  final bool isSuccess;
  final bool isFailure;
  final bool noNetwork;
  final bool loading;
  final bool hideLoading;
  final String errorMessage;

  const CommonState({
    @required this.notification_count,
    @required this.profilePic,
    @required this.isRefresh,
    @required this.name,
    @required this.email,
    @required this.mobile,
    @required this.addressInfo,
    @required this.fromSplash,
    @required this.isSuccess,
    @required this.isFailure,
    @required this.noNetwork,
    @required this.errorMessage,
    @required this.loading,
    @required this.hideLoading,
  });

  factory CommonState.initial() {
    return CommonState(
      notification_count: 0,
        isRefresh: false,
        profilePic: "",
        addressInfo:  "",
        name:  "",
      email:  "",
      mobile:  "",
        fromSplash: false,
      isSuccess: false,
      noNetwork: false,
      isFailure: false,
      hideLoading:  false,
      loading:  false,
      errorMessage: '',
    );
  }


  CommonState dataWith({
     int notification_count,
     String profilePic,
     String addressInfo,
     String name,
    String email,
    String mobile,
     bool isRefresh,
    bool fromSplash,
    bool isFailure,
    bool noNetwork,
    String errorMessage,
    bool loading,
    bool hideLoading,
    bool isSuccess,
  
  }) {
    return CommonState(
      notification_count: notification_count ?? this.notification_count,
      isRefresh: isRefresh?? this.isRefresh,
      profilePic: profilePic?? this.profilePic,
      addressInfo: addressInfo?? this.addressInfo,
      name: name?? this.name,
      email: email?? this.email,
      mobile: mobile?? this.mobile,
      fromSplash: fromSplash?? this.fromSplash,
      loading: loading ?? this.loading,
      isSuccess: isSuccess ?? this.isSuccess,
      hideLoading: hideLoading ?? this.hideLoading,
      isFailure: isFailure ?? this.isFailure,
      noNetwork: noNetwork ?? this.noNetwork,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
    notification_count,
    profilePic,
    isRefresh,
    name,
    mobile,
    email,
    fromSplash,
    isFailure,
    noNetwork,
    errorMessage,
    isSuccess,
    loading,
    hideLoading,
    addressInfo,
  ];

  @override
  String toString() {
    return '''MyFormState {
      notification_count: $notification_count,
      fromSplash: $fromSplash,
            addressInfo: $addressInfo,
          email: $email,
    }''';
  }
}
