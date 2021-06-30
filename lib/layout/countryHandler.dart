import 'dart:convert';
import 'package:flutter/services.dart';

class CountryHandler {

  Future <Map> getcountry(String name) async {
    Map data = jsonDecode(await rootBundle.loadString('data/data.json'));
    return data['countries'][name];
  }
  // gac ==> get all countries
  Future <Map> gac() async{
    Map data = jsonDecode(await rootBundle.loadString('data/data.json'));
    return data['countries'];
  }

}