import 'package:flutter/material.dart';
import 'package:prayer_imes/tools.dart';
import 'package:shared_preferences/shared_preferences.dart';

GlobalKey<_FreeLocalizations> freeLocalizationStateKey1 =
new GlobalKey<_FreeLocalizations>(); //

class FreeLocalizations extends StatefulWidget {
  final Widget child;

  FreeLocalizations({Key key, this.child}) : super(key: key);

  @override
  State<FreeLocalizations> createState() {
    return new _FreeLocalizations();
  }
}



class _FreeLocalizations extends State<FreeLocalizations> {
  Locale _locale = Locale("en", "");

  Future<Locale> getDeviceLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageStr = prefs.getString('languageCode');
    String country = prefs.getString('countryCode');
    return Locale(languageStr, country);
  }

  //监听bus
  void listen() {
    eventBus.on<Locale>().listen((locale) {
      changeLocale(locale);
    });
  }

  changeLocale(Locale locale) {
    if (!mounted) {
      return;
    }

    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future<Locale> locale = getDeviceLocale();
    locale.then((locales) {
      changeLocale(locales);
    });
  }

  @override
  Widget build(BuildContext context) {
//    listen(); 是否需要全部更新
    return new Localizations.override(
      context: context,
      locale: _locale, // widget.locale,
      child: widget.child,
    );
  }
}