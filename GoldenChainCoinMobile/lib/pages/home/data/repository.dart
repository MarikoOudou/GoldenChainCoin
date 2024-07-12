// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:goldenchaincoin/pages/home/model/HomeModel.dart';

class Repository {

  Future<HomeModel> readJsonForHomeModel() async {
  print("repository ...");
  final String response = await rootBundle.loadString('assets/homeData.json');
  print(response);
  final data = HomeModel.fromJson(response);

  // ignore: avoid_print
  print("DATA TO INFO HOME : " + data.toString());
  // final data =  await json.decode(response);
  return data;

}
  
}