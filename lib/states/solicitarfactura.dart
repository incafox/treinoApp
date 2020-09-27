import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SolicitarFacturaCubit extends Cubit<String>{
  SolicitarFacturaCubit() : super(null);

  Future<String> facturaRequest(
    String email, String razonSocial,
    String rfc, String ciudad,
    String colonia, String direccion,
    String cp
  ) async {
    emit("Loading"); 
    try{
      final response = await http 
            .post('https://treino.club/demo/api/AppMovil/registrar', 
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
          'email': email,
          'razonSocial': razonSocial,
          'rfc': rfc,
          'ciudad': ciudad,
          'colonia': colonia,
          'direccion': direccion,
          'cp': cp,
        })); 
        print(response.body);

        Map<String, dynamic> responseData = jsonDecode(response.body);
    
    } on Exception {
      print("");
    }

    return "";
  }


}