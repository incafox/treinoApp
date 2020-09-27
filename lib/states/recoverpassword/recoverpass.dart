import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:treino/states/recoverpassword/recoverpassstate.dart';

class RecuperarPasswordCubit extends Cubit<RecoverPassState> {
  RecuperarPasswordCubit() : super(InitialState());
  // UserInfo info = new UserInfo();

  Future<void> recuperarPassword(String correo) async {
    emit(RecoverPassLoading());
    try {
      final response = await http.post("https://treino.club/demo/api/AppMovil/recuperarPassword",
          body: jsonEncode({'correo': correo}));
          
        Map<String, dynamic> responseData = json.decode(response.body);

        if (responseData["error"] == 1) {
          emit(RecoverPassError(responseData["description"]));
          return;
        }
        
        emit(RecoverPassSuccess());
    } catch (e) {
      print(e);
      emit(RecoverPassRequestError());
    }
  }
}
