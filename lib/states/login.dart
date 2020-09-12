import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class LoginCubit extends Cubit<int> {
  LoginCubit() : super(0);
  UserInfo info = new UserInfo();

  void loginInto(String correo, String password) async {
    print(correo + " = " + password);
    FormData formData =
        FormData.fromMap({'correo': correo, 'password': password});
    var dio = Dio();
    try {
      await dio.get("https://treino.club/demo/api/AppMovil/login",
          queryParameters: {
            "correo": correo,
            "password": password
          }).then((value) {
        print(value.data);
        var error = (json.decode(value.data)['error']);
        if (error == "1") {
          print("hay un error");
        } else {
          print("parse la info");
          this.info = json.decode(value.data);
        }
      });
    } catch (e) {
      print(e);
    }
  }
}

class UserInfo {
  final String error;
  final String descripcion;
  final String id;
  final String nombre;
  final String apellidos;
  final String correo;
  final String creditos;
  final String telefono;
  final String ciudad;
  final String fechaNacimiento;

  UserInfo(
      {this.error,
      this.descripcion,
      this.id,
      this.nombre,
      this.apellidos,
      this.correo,
      this.creditos,
      this.telefono,
      this.ciudad,
      this.fechaNacimiento});

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      error: json['error'],
      descripcion: json['descripcion'],
      id: json['id'],
      nombre: json['nombre'],
      apellidos: json['apellidos'],
      correo: json['correo'],
      creditos: json['creditos'],
      telefono: json['telefono'],
      ciudad: json['ciudad'],
      fechaNacimiento: json['fechaNacimiento'],
    );
  }
}
