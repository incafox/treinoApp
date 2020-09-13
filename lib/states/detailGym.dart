import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class GymDetailCubit extends Cubit<int> {
  GymDetailCubit() : super(0);
  var response;
  void getGymById(String id) async {
    var dio = Dio();
    try {
      await dio.get("https://treino.club/demo/api/AppMovil/getGymByID",
          queryParameters: {"id": id}).then((value) {
        print(value.data);
        this.response = (json.decode(value.data));
      });
    } catch (e) {
      print(e);
    }
  }
}
