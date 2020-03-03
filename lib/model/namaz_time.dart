import 'package:prayer_imes/bd/app_db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';



class NamazTime {
  int id;
  String name;
  String time;
  int fajr;
  int dhur;
  int asr;
  int maghrib;
  int isha;


  NamazTime(this.time,
      this.name,
      this.fajr,
      this.dhur,
      this.asr,
      this.maghrib,
      this.isha);

  NamazTime.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    fajr = json['fajr'];
    dhur = json['dhur'];
    asr = json['asr'];
    maghrib = json['maghrib'];
    id = json['id'];
    name = json['name'];
    isha = json['isha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['fajr'] = this.fajr;
    data['dhur'] = this.dhur;
    data['asr'] = this.asr;
    data['maghrib'] = this.maghrib;
    data['id'] = this.id;
    data['name'] = this.name;
    data['isha'] = this.isha;
    return data;
  }
}

