import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';
import 'package:dio/dio.dart';

class TabPerfilCubit extends Cubit<int> {
  TabPerfilCubit(int state) : super(state);

  Future<bool> sendPerfilPhoto (String userId,var path) async { 
    final dio = Dio();
    //final photo = await MultipartFile.fromFile(path,filename: "image.jpg");
    final photo = path;

    FormData formData = new FormData.fromMap({
      "id": userId,
      "fotoPerfil": photo
    });

    final response = await dio.post("https://treino.club/demo/api/AppMovil/actualizarFotoProfile", data: formData);
    print(response);
  }

}