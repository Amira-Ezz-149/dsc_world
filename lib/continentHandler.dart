import 'dart:convert';
import 'package:flutter/services.dart';


class ContinentHandler {

  Future <Map> getcontinent(String name) async {
    Map data = jsonDecode(await rootBundle.loadString('data/data.json'));
   return data['continents'][name];
  }
  Future <Map> getAllcontinents() async{
    Map data = jsonDecode(await rootBundle.loadString('data/data.json'));
    return data['continents'];
  }

}

