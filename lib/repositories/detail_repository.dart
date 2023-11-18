import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:project01/models/detail.dart';
import 'package:project01/service/api_caller.dart';


class DetailRepo{
  Future<List<Detail>> getDetails() async {
    try {
      var result = await ApiCaller().get('details?');
      List list = jsonDecode(result);
      List<Detail> detailList =
      list.map<Detail>((item) => Detail.fromJson(item)).toList();
      return detailList;
    } catch (e) {
      // TODO:
      rethrow;
    }
  }
}