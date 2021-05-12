/*
 * Copyright (c) 2021, Vipin.
 */

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_vip/bloc/common/common_state.dart';
import 'package:flutter_template_vip/data/repository/iapp_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_template_vip/data/service/connectivity_service.dart';

class CommonBloc extends Cubit<CommonState> {

  IAppRepository appRepository;

  CommonBloc(this.appRepository) : super(CommonState.initial());

  Future<void> checkServiceAvailable(bool loading, String token) async {

    if(await ConnectivityService.isConnected()) {

      try {

        if(!loading)
          emit(state.dataWith(
              noNetwork: false,
              isFailure: false,
              loading: true,
              hideLoading: false,
              isSuccess:  false));

        Map<String, dynamic> payload = {
          "":"",
          "":""};

        print("request: ${payload.toString()}");

        //   ServiceAvailableResponds responds = await appRepository.checkServiceAval(payload,token);

        /*if (responds != null) {
          if (responds != null) {
            emit(state.dataWith(
                noNetwork: false,
                isFailure: false,
                loading: false,
                hideLoading: false,
                isSuccess: true,
                errorMessage: responds.message));

            print("callFullReview------ - ${responds.message}");
          }else
            setStatevalues(responds.message);
        }
        else
          setStatevalues("");*/

      } catch (e) {

        setStatevalues("Internal error");
      }

    }else{
      emit(state.dataWith(
          noNetwork: true,
          isFailure: false,
          loading: false,
          hideLoading: false,
          isSuccess:  false));
      print("no internet");
    }

  }

  Future<void> setStatevalues(String msg) async{
    emit(state.dataWith(
        noNetwork: false,
        isFailure: true,
        loading: false,
        errorMessage: msg,
        hideLoading: false,
        isSuccess:  false));
  }

  Future<void> setNotificationCount(int count) async {
      emit(state.dataWith(notification_count: count,
          noNetwork: false,
          isFailure: false,
          loading: false,
          hideLoading: false,
          isSuccess:  false) );
  }

  Future<void> setProfilePic(String pic) async {
    emit(state.dataWith(profilePic: pic,  noNetwork: false,
        isFailure: false,
        loading: false,
        hideLoading: false,
        isSuccess:  false) );
  }

  Future<void> setRefresh(bool flag) async {
    emit(state.dataWith(isRefresh: flag,  noNetwork: false,
        isFailure: false,
        loading: false,
        hideLoading: false,
        isSuccess:  false) );
  }


  Future<void> setUserinfo(String name,String email,String mobile) async {
    emit(state.dataWith(
        name: name,
        email: email,
        mobile: mobile,
        noNetwork: false,
        isFailure: false,
        loading: false,
        hideLoading: false,
        isSuccess:  false) );
  }


  Future<void> setIsSplash(bool flag) async {
    emit(state.dataWith(fromSplash: flag,
        noNetwork: false,
        isFailure: false,
        loading: false,
        hideLoading: false,
        isSuccess:  false) );
  }

}
