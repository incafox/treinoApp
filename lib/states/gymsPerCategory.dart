import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class GymsPerCategoryCubit extends Cubit<int> {
  GymsPerCategoryCubit() : super(0);
  // UserInfo info = new UserInfo();
  List<dynamic> items = List();

  void getGymByCategoria(String idCategorie) async {
    var dio = Dio();
    try {
      await dio.get("https://treino.club/demo/api/AppMovil/getGymsByCategoria",
          queryParameters: {"idCategoria": idCategorie}).then((value) {
        print(value.data);
        var itemss = (json.decode(value.data)['items']);
        this.items = itemss;
      });
    } catch (e) {
      print(e);
    }
  }
}
