import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class CategoriesCubit extends Cubit<int> {
  CategoriesCubit() : super(0);
  // UserInfo info = new UserInfo();

  void loginInto(String idCategorie) async {
    var dio = Dio();
    try {
      await dio.get("https://treino.club/demo/api/AppMovil/getGymsByCategoria",
          queryParameters: {"idCategoria": idCategorie}).then((value) {
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
