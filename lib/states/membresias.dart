import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class MembresiasCubit extends Cubit<int> {
  MembresiasCubit() : super(0);
  var items;
  void getMembresias() async {
    var dio = Dio();
    try {
      await dio
          .get("https://treino.club/demo/api/AppMovil/getMembresias")
          .then((value) {
        print(value.data);
        this.items = (json.decode(value.data));
      });
    } catch (e) {
      print(e);
    }
  }
}
