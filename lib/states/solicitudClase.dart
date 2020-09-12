import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class GymDetailCubit extends Cubit<int> {
  GymDetailCubit() : super(0);
  // UserInfo info = new UserInfo();

  void loginInto(
      String idClase, String idCliente, String idGym, String fecha) async {
    var dio = Dio();
    try {
      await dio.get("https://treino.club/demo/api/AppMovil/agregarSolicitud",
          queryParameters: {
            "idClase": idClase,
            "idCliente": idCliente,
            "idGym": idGym,
            "fecha": fecha
          }).then((value) {
        print(value.data);
        // var error = (json.decode(value.data)['error']);
      });
    } catch (e) {
      print(e);
    }
  }
}
