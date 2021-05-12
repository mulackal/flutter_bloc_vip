/*
 * Copyright (c) 2021, Vipin.
 */


import 'dart:async';

import 'package:flutter_template_vip/view/cart/mycart_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_template_vip/bloc/bloc_observer.dart';
import 'package:flutter_template_vip/bloc/common/common_bloc.dart';
import 'package:flutter_template_vip/data/service/enums.dart';
import 'package:flutter_template_vip/util/custom_pagination.dart';
import 'package:flutter_template_vip/util/resource_string.dart';
import 'package:flutter_template_vip/bloc/theme/theme_state.dart';

import 'package:flutter_template_vip/util/styles/app_colors.dart';

import 'package:flutter_template_vip/view/login/login_page.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_vip/view/splash/splash_page.dart';


import 'bloc/common/common_bloc.dart';
import 'bloc/theme/theme_bloc.dart';
import 'package:flutter_template_vip/data/repository/repository_factory.dart';
import 'package:flutter_template_vip/data/repository/iapp_repository.dart';
import 'package:flutter_template_vip/data/service/shared_preference_service.dart';

import 'data/service/constants.dart';

void main() async {
  /** need basic setup**/
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance.resamplingEnabled = true;

  /** SimpleBlocObserver oversees Blocs and delegates to BlocDelegate.
      BlocDelegate handles events from all Blocs which are delegated by the BlocSupervisor.
      Can be used to intercept all Bloc events, transitions, and errors.
      It is a great way to handle logging/analytics as well as error handling universally.**/
  Bloc.observer = SimpleBlocObserver();

  // shared pref service
  final sharedPrefService = await SharedPreferencesService.instance;

  config();

  // app default theme
  ThemeMode themeMode;
  final bool isDarkModeEnabled =
      sharedPrefService.getBoolSession(SharedPrefKeys.darkModeEnabled);
  if (isDarkModeEnabled == null) {
    sharedPrefService.setBoolSesssion(SharedPrefKeys.darkModeEnabled, false);
    themeMode = ThemeMode.light;
  } else {
    themeMode = isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light;
  }

  // init app repository
  final appRepository =
      await RepositoryFactory.createRepository(Repository.CleanApp);


  runApp(
    new MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IAppRepository>(
          create: (_) => appRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => ThemeBloc(themeMode),
          ),
          BlocProvider(
            create: (_) => CommonBloc(appRepository),
          ),
        ],
        child: MyApp(),
      ),
    ),
  );


}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {


  @override
  void initState() {

    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                themeMode: themeState.themeMode,
                theme: ThemeData(
                  brightness: Brightness.light,
                  primaryColor: AppColors.mainColor,
                  primaryColorDark: AppColors.secondaryColor,
                  accentColor: AppColors.accentColor,
                  hintColor:  AppColors.white,
                  scaffoldBackgroundColor: AppColors.secondaryColor,
                  primarySwatch: Colors.orange,
                  floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: AppColors.floating_button,
                  ),
                  accentIconTheme: IconThemeData(color: AppColors.white),
                  buttonTheme: ButtonThemeData(
                    buttonColor: Colors.white,
                    height: 50,
                    minWidth: double.infinity,
                  ),
                  pageTransitionsTheme: PageTransitionsTheme(
                    builders: {
                      TargetPlatform.android: CustomPageTransitionBuilder(),
                      TargetPlatform.iOS: CustomPageTransitionBuilder(),
                    },
                  ),
                ),
                darkTheme: ThemeData(
                  primarySwatch: Colors.orange,
                  brightness: Brightness.dark,
                  primaryColor: AppColors.mainColor,
                  primaryColorDark: AppColors.secondaryColor,
                  accentColor: AppColors.accentColor,
                  hintColor:  AppColors.white,
                  primaryColorBrightness: Brightness.dark,
                  accentIconTheme: IconThemeData(color: AppColors.white),
                  accentColorBrightness: Brightness.dark,
                  buttonTheme: ButtonThemeData(
                    buttonColor: Colors.orange,
                    height: 50,
                    minWidth: double.infinity,
                  ),
                ),
                home: SplashScreen(),
                routes: routes,
                onUnknownRoute: (settings) {
                  return MaterialPageRoute(
                    builder: (ctx) => SplashScreen(),
                  );
                },
              );

        },
      );
  }

  var routes = <String, WidgetBuilder>{
    "/splash": (BuildContext context) => SplashScreen(),
    LoginPages.routeName: (BuildContext context) => LoginPages(),
    MyCartPage.routeName: (BuildContext context) => MyCartPage(),

  };

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

}

Future config() async {

  /** set device orientation**/
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  /** load resource strings **/
  ResourceString();

}
