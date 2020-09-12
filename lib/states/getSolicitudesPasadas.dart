import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class GymDetailCubit extends Cubit<int> {
  GymDetailCubit() : super(0);
  // UserInfo info = new UserInfo();

  void loginInto(String idCliente) async {
    var dio = Dio();
    try {
      await dio.get(
          "https://treino.club/demo/api/AppMovil/getSolicitudesPasadas",
          queryParameters: {
            "idCliente": idCliente,
          }).then((value) {
        print(value.data);
        // var error = (json.decode(value.data)['error']);
      });
    } catch (e) {
      print(e);
    }
  }
}
