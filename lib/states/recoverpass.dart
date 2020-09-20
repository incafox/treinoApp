import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class RecuperarPasswordCubit extends Cubit<bool> {
  RecuperarPasswordCubit() : super(null);
  // UserInfo info = new UserInfo();

  Future<bool> recuperarPassword(String correo) async {
    // print(correo + " = " + password);
    try {
      await http.post("https://treino.club/demo/api/AppMovil/recuperarPassword",
          body: {'id': correo}).then((value) {
        print(value.body);
        var error = (json.decode(value.body)['error']);
        if (error == "1") {
          emit(false);
          print("hay un error");
          return false;
        } else {
          emit(true);
          print("parse la info");
          return true;
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
