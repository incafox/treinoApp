import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class ClassDetailCubit extends Cubit<int> {
  ClassDetailCubit() : super(0);
  // UserInfo info = new UserInfo();
  var response;

  void getClaseByID(String id) async {
    var dio = Dio();
    try {
      await dio.get("https://treino.club/demo/api/AppMovil/getClaseByID",
          queryParameters: {"id": id}).then((value) {
        print(value.data);
        var res = (json.decode(value.data));
        this.response = res;
      });
    } catch (e) {
      print(e);
    }
  }
}
