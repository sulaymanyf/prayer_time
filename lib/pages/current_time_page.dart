import 'package:flutter/material.dart';
import 'package:flutter_adhan/flutter_adhan.dart';
import 'package:flutter_adhan/time_util/paryer_times.dart';
import 'package:intl/intl.dart';
import 'package:prayer_imes/model/namaz_db_util.dart';
import 'package:prayer_imes/model/namaz_time.dart';
import 'package:prayer_imes/model/prayer_time.dart';
import 'package:prayer_imes/prayer_time/clock.dart';

class CurrentTimePage extends StatefulWidget {
  _CurrentTimePageState createState() => _CurrentTimePageState();
}

class _CurrentTimePageState extends State<CurrentTimePage> {
  NamazBdUtil namazBdUtil = NamazBdUtil();

  final double _smallFontSize = 12;
  final double _valFontSize = 30;
  final FontWeight _smallFontWeight = FontWeight.w500;
  final FontWeight _valFontWeight = FontWeight.w700;
  final Color _fontColor = Color(0xff5b6990);
  final double _smallFontSpacing = 1.3;

  @override
  void initState() {
    super.initState();
    getNamazTime();
  }

  NamazTime namazTime;
  PrayerTime prayerTime;
  DateTime nextPrayerTime;
  String diffTime;

  String current_time() {
    var now = DateTime.now();
    var format = new DateFormat('HH:mm a');

    var timeZoneName = now.timeZoneName;
    print("timeZoneName" + timeZoneName);
    return format.format(now);
  }

  String current_Date() {
    var now = DateTime.now();
    var format = new DateFormat('yyyy-MM-dd');
    return format.format(now);
  }

  getData(int d) {
    var now = DateTime.now();
    var duration = Duration(days: DateTime.now().day + d);
    var format = new DateFormat('yyyy-MM-dd');
    return format.format(now.add(duration));
  }

  nextTime(PrayerTimes prayerTimes) {
    DateTime nowTime = DateTime.now();
    if (nowTime.isAfter(DateTime(
            prayerTimes.fajr.year,
            prayerTimes.fajr.month,
            prayerTimes.fajr.day - 1,
            prayerTimes.fajr.hour,
            prayerTimes.fajr.minute)) &&
        nowTime.isBefore(prayerTimes.fajr)) {
      // 当前时间是在晨礼和尚礼之间
      return prayerTimes.fajr;
    } else if (nowTime.isAfter(prayerTimes.fajr) &&
        nowTime.isBefore(prayerTimes.dhuhr)) {
      // 当前时间是在尚礼和普礼之间
      return prayerTimes.dhuhr;
    } else if (nowTime.isAfter(prayerTimes.dhuhr) &&
        nowTime.isBefore(prayerTimes.maghrib)) {
      // 当前时间是在普礼和婫之间
      return prayerTimes.maghrib;
    } else if (nowTime.isAfter(prayerTimes.maghrib) &&
        nowTime.isBefore(prayerTimes.isha)) {
      // 当前时间是在晨礼和尚礼之间
      return prayerTimes.isha;
    } else if (nowTime.isAfter(prayerTimes.fajr) &&
        nowTime.isBefore(DateTime(
            prayerTimes.fajr.year,
            prayerTimes.fajr.month,
            prayerTimes.fajr.day + 1,
            prayerTimes.fajr.hour,
            prayerTimes.fajr.minute))) {}

        return DateTime(
            prayerTimes.fajr.year,
            prayerTimes.fajr.month,
            prayerTimes.fajr.day + 1,
            prayerTimes.fajr.hour,
            prayerTimes.fajr.minute);
  }

  diffNexiTime() {
    var time = DateTime.now();
    var atSameMomentAs = nextPrayerTime.difference(time);
    print(atSameMomentAs);
    var inMinutes = atSameMomentAs.inMinutes;
    print(inMinutes);
    int hour = (inMinutes / 60).floor();
    int minuttes = inMinutes - hour * 60;
    diffTime = hour.toString() + "h" + minuttes.toString()+"m";
    print("diffTime:$diffTime");
    return atSameMomentAs;
  }

//获取编号为1的书
  void getNamazTime() async {
    PrayerTimes prayerTimes =
        PrayerTimeUtil.getPrayerTime(24.46, 118.1, 'HANAFI', 1);
    print(prayerTimes.toJson());
    nextPrayerTime = nextTime(prayerTimes);
    PrayerTime prayer = PrayerTime.fromJson(prayerTimes.toJson());
    NamazTime namaz = await namazBdUtil.getNamazTime(current_Date());
    diffNexiTime();
    if (namaz == null) {
      await namazBdUtil
          .insert(new NamazTime(current_Date(), "user", 0, 0, 0, 0, 0));
      namaz = await namazBdUtil.getNamazTime(current_Date());
      //切记用完就close
    }
    print("==========");
    print(namaz.toJson());
    print(namaz.isha);
    print(namaz?.isha == 0);
    print("==========");

//    await namazTimeSqlite.update( NamazTime.fromJson( {"time": "wo", "fajr": 1, "dhur": 0, "asr": 2, "maghrib": 1, "id": 1, "name": "2019-2-29", "isha": 2}));
    setState(() {
      print("ssssssss");
      namazTime = namaz;
      prayerTime = prayer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[

          Container(
//        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              alignment: Alignment.topCenter,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Clock(),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Current Time",
                            style: TextStyle(
                                color: Color(0xffff0863),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.3),
                          ),
                          Text(
                            current_time(),
                            style: TextStyle(
                                color: Color(0xff2d386b),
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Current Prayer Time",
                            style: TextStyle(
                                color: Color(0xffff0863),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.3),
                          ),
                          Text(
                            nextPrayerTime == null
                                ? ''
                                : DateFormat('HH:mm a')
                                .format(nextPrayerTime),
                            style: TextStyle(
                                color: Color(0xff2d386b),
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Column(
                    children: <Widget>[
                      ListTile(
                        title: Text("Salah(ٱلصَّلَاة‎)"),
                        trailing: Padding(
                          padding: new EdgeInsets.fromLTRB(
                              10.0, 10.0, 10.0, 10.0),
                          child: Text(
                            diffTime == null ? '' : diffTime,
                            style: TextStyle(
                                color: Color(0xff23383b),
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        title: Text("Fajr(فجر)"),
                        subtitle: Text(prayerTime?.fajr == null
                            ? ''
                            : prayerTime?.fajr),
                        trailing: new Icon(
                          // 新增代码开始 ...
                          namazTime?.fajr == 0
                              ? Icons.favorite_border
                              : Icons.favorite,
                          color: getColor(namazTime?.fajr),
                        ),
                        leading: Icon(Icons.access_time),
                        onLongPress: () => longTouchSave("Fajr"),
                        onTap: () => touchSave("Fajr"),
                      ),
                      ListTile(
                        title: Text("Dhur(ظهر)"),
                        subtitle: Text(prayerTime?.dhuhr == null
                            ? ''
                            : prayerTime?.dhuhr),
                        trailing: new Icon(
                          // 新增代码开始 ...
                          namazTime?.dhur == 0
                              ? Icons.favorite_border
                              : Icons.favorite,
                          color: getColor(namazTime?.dhur),
                        ),
                        leading: Icon(Icons.access_time),
                        onLongPress: () => longTouchSave("Dhur"),
                        onTap: () => touchSave("Dhur"),
                      ),
                      ListTile(
                        title: Text("Asr(عصر)"),
                        subtitle: Text(
                            prayerTime?.asr == null ? '' : prayerTime?.asr),
                        trailing: new Icon(
                          // 新增代码开始 ...
                          namazTime?.asr == 0
                              ? Icons.favorite_border
                              : Icons.favorite,
                          color: getColor(namazTime?.asr),
                        ),
                        leading: Icon(Icons.access_time),
                        onTap: () => touchSave("Asr"),
                        onLongPress: () => longTouchSave("Asr"),
                      ),
                      ListTile(
                        title: Text("Maghrib(مغرب)"),
                        subtitle: Text(prayerTime?.maghrib == null
                            ? ''
                            : prayerTime?.maghrib),
                        trailing: new Icon(
                          // 新增代码开始 ...
                          namazTime?.maghrib == 0
                              ? Icons.favorite_border
                              : Icons.favorite,
                          color: getColor(namazTime?.maghrib),
                        ),
                        leading: Icon(Icons.access_time),
                        onTap: () => touchSave("Maghrib"),
                        onLongPress: () => longTouchSave("Maghrib"),
                      ),
                      ListTile(
                        title: Text("Isha(عشاء) "),
                        subtitle: Text(prayerTime?.isha == null
                            ? ''
                            : prayerTime?.isha),
                        trailing: new Icon(
                          // 新增代码开始 ...
                          namazTime?.isha == 0
                              ? Icons.favorite_border
                              : Icons.favorite,
                          color: getColor(namazTime?.isha),
                        ),
                        leading: Icon(Icons.access_time),
                        onLongPress: () => longTouchSave("Isha"),
                        onTap: () => touchSave("Isha"),
                      ),
                      SizedBox(height: 20),
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }

  getColor(num) {
    if (num == 1) {
      return Colors.red;
    } else if (num == 2) {
      return Colors.amber;
    } else {
      return null;
    }
  }

  touchSave(position) async {
    _changeStatus(position, 1);
    print(namazTime.toJson());
    await namazBdUtil.update(namazTime);
    getNamazTime();
  }

  longTouchSave(position) async {
    print("long");
    _changeStatus(position, 2);
    print(namazTime.toJson());
    await namazBdUtil.update(namazTime);
    getNamazTime();
  }

  _changeStatus(vakit, num) {
    switch (vakit) {
      case 'Fajr':
        namazTime.fajr = num;
        break;
      case 'Dhur':
        namazTime.dhur = num;
        break;
      case 'Asr':
        namazTime.asr = num;
        break;
      case 'Maghrib':
        namazTime.maghrib = num;
        break;
      case 'Isha':
        namazTime.isha = num;
        break;
    }
  }
}

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(50, 0, 50, 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
            child: Text(
              "EDIT ALARMS",
              style: TextStyle(letterSpacing: 1.5),
            ),
            color: Color(0xffff5e92),
            textColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            onPressed: () {},
          ),
          FloatingActionButton(
            child: Text(
              "+",
              style: TextStyle(
                  color: Color(0xff253165),
                  fontWeight: FontWeight.w700,
                  fontSize: 25),
            ),
            onPressed: () {},
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 5,
            highlightElevation: 3,
          )
        ],
      ),
    );
  }
}
