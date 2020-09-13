import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class SolicitudesPasadasCubit extends Cubit<int> {
  SolicitudesPasadasCubit() : super(0);
  var response;
  void getSolicitudesPasadas(String idCliente) async {
    var dio = Dio();
    try {
      await dio.get(
          "https://treino.club/demo/api/AppMovil/getSolicitudesPasadas",
          queryParameters: {
            "idCliente": idCliente,
          }).then((value) {
        print(value.data);
        this.response = (json.decode(value.data)['error']);
      });
    } catch (e) {
      print(e);
    }
  }
}
