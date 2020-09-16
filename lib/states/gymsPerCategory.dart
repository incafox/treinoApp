import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class GymsPerCategoryCubit extends Cubit<List<dynamic>> {
  GymsPerCategoryCubit() : super(null);
  // UserInfo info = new UserInfo();
  List<dynamic> items = List();
  String idCategoriaSeleccionado = "1";

  void setIdCategoria(String val) {
    this.idCategoriaSeleccionado = val;
  }

  void getGymByCategoria(String idCategorie) async {
    final response = await http.post(
        'https://treino.club/demo/api/AppMovil/getGymsByCategoria',
        body: json.encode({"idCategoria": idCategorie}));
    this.items = jsonDecode(response.body)['items'];
    print(jsonDecode(response.body)['items']);

    emit(this.items);
  }
}
