import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class LoginCubit extends Cubit<int> {
  LoginCubit() : super(0);
  // UserInfo info = new UserInfo();

  void loginInto(String id, String password, String nombre, String apelli,
      String telefono, String ciudad, String fechaNac, String genero) async {
    // print(correo + " = " + password);

    var dio = Dio();
    try {
      await dio.get("https://treino.club/demo/api/AppMovil/registrar",
          queryParameters: {
            'id': id,
            'password': password,
            'nombre': nombre,
            'apellidos': apelli,
            'telefono': telefono,
            'ciudad': ciudad,
            'fechaNacimiento': fechaNac,
            'genero': genero
          }).then((value) {
        print(value.data);
        var error = (json.decode(value.data)['error']);
        if (error == "1") {
          print("hay un error");
        } else {
          print("parse la info");
          // this.info = json.decode(value.data);
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
