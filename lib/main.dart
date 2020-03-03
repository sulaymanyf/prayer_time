import 'package:flutter/material.dart';

import 'navigator/tab_navigator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Color primaryColor = Color(0xffFD6592);
  final Color bgColor = Color(0xffF9E0E3);
  final Color secondaryColor = Color(0xff324558);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
      home: TabNavigator(),
//      localeResolutionCallback: (deviceLocale, supportedLocales) {
//        print('deviceLocale: $deviceLocale');
//        incrementCounter(deviceLocale);
//      },
//      supportedLocales: [
//        const Locale('de', 'DE'), // German
//        const Locale('en', 'US'), // English
//        const Locale('zh', 'CN'), // English
//      ],
    );
  }
}



