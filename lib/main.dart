import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:prayer_imes/tools.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'boot_page/onn_boarding_screen.dart';
import 'free_loca_lizations.dart';
import 'generated/i18n.dart';
import 'navigator/tab_navigator.dart';

void main() {
  runApp(MyApp());

  if (Platform.isAndroid) {
// 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  final Color primaryColor = Color(0xffFD6592);
  final Color bgColor = Color(0xffF9E0E3);
  final Color secondaryColor = Color(0xff324558);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            textTheme: TextTheme(
              title: TextStyle(
                color: secondaryColor,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            iconTheme: IconThemeData(color: secondaryColor),
            actionsIconTheme: IconThemeData(
              color: secondaryColor,
            ),
          ),
        ),
        home: FreeLocalizations(
            key: freeLocalizationStateKey1, child: starApp() //TabNavigator(),
            ));
  }

  Future<bool> getStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("boot") || null) {
      return true;
    } else {
      prefs.setBool("boot", true);
      return false;
    }
  }
  starApp(){
    getStatus().then((res){
      if(res){
        return TabNavigator();
      }else{
        return OnboardingScreen();
      }
    });

  }
}
