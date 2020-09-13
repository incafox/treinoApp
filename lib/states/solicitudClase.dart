import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class AgregarSolicitudCubit extends Cubit<int> {
  AgregarSolicitudCubit() : super(0);
  var response;
  void agregarSolicitud(
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
        this.response = (json.decode(value.data));
      });
    } catch (e) {
      print(e);
    }
  }
}
