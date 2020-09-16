import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class AgregarSolicitudCubit extends Cubit<dynamic> {
  AgregarSolicitudCubit() : super(0);
  dynamic response;
  String idClase = "-";
  String idCliente = "-";
  String idGym = "-";
  String fecha = "2020-11-10";

  void setIdClase(String val) => this.idClase = val;
  void setIdCliente(String val) => this.idCliente = val;
  void setIdGym(String val) => this.idGym = val;
  void setFecha(String val) => this.fecha = val;
  // void setFecha(String val) => this.fecha = val;

//{String idClase, String idCliente, String idGym, String fecha}
  Future<bool> agregarSolicitud() async {
    // var dio = Dio();
    bool respuesta = false;
    print("clase " + this.idClase);
    print("cliente " + this.idCliente);
    print("gym " + this.idGym);
    print("fecha " + this.fecha);
    try {
      await http
          .post("https://treino.club/demo/api/AppMovil/agregarSolicitud",
              body: json.encode({
                "idClase": this.idClase,
                "idCliente": this.idCliente,
                "idGym": this.idGym,
                "fecha": this.fecha
              }))
          .then((value) {
        print("agregar solicitud  " + value.body);
        this.response = (json.decode(value.body));
        if (this.response['error'] == "0") {
          response = true;
        } else {
          response = false;
        }
        emit(this.response);
      });
    } catch (e) {
      print(e);
    }
    return respuesta;
  }
}
