import 'package:flutter/material.dart';
import 'package:prayer_imes/pages/current_time_page.dart';
import 'package:prayer_imes/pages/paryer_info_page.dart';
import 'package:prayer_imes/pages/profile_detail_page.dart';

import 'navigator/tab_navigator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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


//class AppClock extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
////        height: 400,
////        width: double.infinity,
//        child: DefaultTabController(
//            length: 3,
//            child: Scaffold(
////                bottomNavigationBar: BottomBar(),
//                appBar: AppBar(
//                  elevation: 0.0,
//                  backgroundColor: Colors.transparent,
////                  bottom: PreferredSize(
////                    preferredSize: Size.fromHeight(35),
////                    child: Container(
////                      color: Colors.transparent,
////                      child: SafeArea(
////                        child: Column(
////                          children: <Widget>[
//////                            TabBar(
//////                                indicator: UnderlineTabIndicator(
//////                                    borderSide: BorderSide(
//////                                        color: Color(0xffff0863), width: 4.0),
//////                                    insets: EdgeInsets.fromLTRB(
//////                                        20.0, 20.0, 20.0, 0)),
//////                                indicatorWeight: 10,
//////                                indicatorSize: TabBarIndicatorSize.label,
//////                                labelColor: Color(0xff2d386b),
//////                                labelStyle: TextStyle(
//////                                    fontSize: 12,
//////                                    letterSpacing: 1.3,
//////                                    fontWeight: FontWeight.w500),
//////                                unselectedLabelColor: Colors.black26,
//////                                tabs: [
//////                                  Tab(
//////                                    text: "CURRENT TIME",
//////                                    icon: Icon(Icons.access_time, size: 20),
//////                                  ),
//////                                  Tab(
//////                                    text: "PRAYER TIME",
//////                                    icon: Icon(Icons.timer, size: 20),
//////                                  ),
//////                                  Tab(
//////                                    text: "PROFILE",
//////                                    icon: Icon(Icons.art_track, size: 20),
//////                                  ),
//////                                ])
////                          ],
////                        ),
////                      ),
////                    ),
////                  ),
//                ),
//                body: TabBarView(
//                  children: <Widget>[
//                    Center(
//                      child: FirstTab(),
//                    ),
//                    Center(
//                      child: SecondTab(),
//                    ),
//                    Center(
//                      child: ProfileDetail(),
//                    )
//                  ],
//                ))));
//  }
//}

