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

  void reset() {
    emit(null);
  }

  void getGymByCategoria(String idCategorie) async {
    final response = await http.post(
        'https://treino.club/demo/api/AppMovil/getGymsByCategoria',
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        body: json.encode({"idCategoria": idCategorie}));
    // String body = utf8.decode(response.bodyBytes);
    // String source = Utf8Decoder().convert(response.bodyBytes);
    var myRichRunesMessage = new Runes(response.body);
    // String source = String.fromCharCodes(myRichRunesMessage);

    this.items = json.decode(response.body)['items'];
    print("============");
    print(items);
    print(response.body);
    print("============");
    emit(jsonDecode(jsonEncode(this.items).toString()));
  }
}
