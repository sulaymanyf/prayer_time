import 'package:dio/dio.dart';

class PrayerTimeApi{

  String quranUrl = 'http://localhost:8800/api/prayertime/v1/quran/cuz/';

  void getQuran() async {
    try {
      Response response = await Dio().get(quranUrl);
      print(response);
    } catch (e) {
      print(e);
    }
  }

}