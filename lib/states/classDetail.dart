import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class ClassDetailCubit extends Cubit<dynamic> {
  ClassDetailCubit() : super(null);
  // UserInfo info = new UserInfo();
  dynamic response;

  void getClaseByID(String id) async {
    print('obteniendo detalles de clase ... ' + id);
    try {
      await http
          .post("https://treino.club/demo/api/AppMovil/getClaseByID",
              headers: {'Content-Type': 'application/json'},
              body: json.encode({"id": id}))
          .then((value) {
        print(value.body);
        this.response = (json.decode(value.body));
        // this.response = res;
        emit(this.response);
      });
    } catch (e) {
      print(e);
    }
  }
}
