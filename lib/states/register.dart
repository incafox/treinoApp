import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class RegisterCubit extends Cubit<int> {
  RegisterCubit() : super(0);
  // UserInfo info = new UserInfo();

  Future<String> register(
      {String correo,
      String password,
      String nombre,
      String apelli,
      String telefono,
      String ciudad,
      String fechaNac,
      String genero}) async {
    print(correo + " = " + password);
    // String rpta = '';
    // var dio = Dio();
    // try {
    //   await dio.post("https://treino.club/demo/api/AppMovil/registrar",
    //       queryParameters: {
    //         'correo': correo,
    //         'password': password,
    //         'nombre': nombre,
    //         'apellidos': apelli,
    //         'telefono': telefono,
    //         'ciudad': ciudad,
    //         'fechaNacimiento': fechaNac,
    //         'genero': genero
    //       }).then((value) {
    //     print(value.data);
    //     var error = (json.decode(value.data)['error']);
    //     if (error == "1") {
    //       print("hay un error");
    //     } else {
    //       print("parse la info");
    //       // this.info = json.decode(value.data);
    //     }
    //   });
    // } catch (e) {
    //   print(e);
    // }
    final response = await http
        .post('https://treino.club/demo/api/AppMovil/registrar', body: jsonEncode({
      'correo': correo,
      'password': password,
      'nombre': nombre,
      'apellidos': apelli,
      'telefono': telefono,
      'ciudad': ciudad,
      'fechaNacimiento': fechaNac,
      'genero': genero
    }));
    print(response.body);
    return response.body;
  }
}
