/*
 * Copyright (c) 2021, Vipin.
 */

import 'package:flutter_template_vip/data/service/constants.dart';
import 'package:flutter_template_vip/data/service/shared_preference_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_vip/bloc/theme/theme_event.dart';
import 'package:flutter_template_vip/bloc/theme/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(this.defaultThemeMode) : super(ThemeState(defaultThemeMode));

  final ThemeMode defaultThemeMode;

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ThemeChanged) {
      yield* _mapThemeChangedToState(event.value);
    }
  }


  Stream<ThemeState> _mapThemeChangedToState(bool value) async* {

    final sharedPrefService = await SharedPreferencesService.instance;
    final isDarkModeEnabled = sharedPrefService.getBoolSession(SharedPrefKeys.darkModeEnabled);

    if (value && !isDarkModeEnabled) {
      await sharedPrefService.setBoolSesssion(SharedPrefKeys.darkModeEnabled,true);
      yield ThemeState(ThemeMode.dark);
    } else if (!value && isDarkModeEnabled) {
      await sharedPrefService.setBoolSesssion(SharedPrefKeys.darkModeEnabled,false);
      yield ThemeState(ThemeMode.light);
    }
  }
}
