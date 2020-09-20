import 'package:flutter/material.dart';
import 'package:treino/states/recoverpass.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecoverPasswordPage extends StatefulWidget {
  @override
  _RecoverPasswordPageState createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> {
  TextEditingController input = TextEditingController();
  TextEditingController res = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: this.input,
            decoration: InputDecoration(hintText: "Correo electronico"),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          RaisedButton(
              child: Text(
                "Enviar Solicitud",
                style: TextStyle(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(28.0),
                  side: BorderSide(color: Color(0xbf0781e5))),
              color: Color(0xbf0781e5),
              onPressed: () async {
                bool res = await context
                    .bloc<RecuperarPasswordCubit>()
                    .recuperarPassword(this.input.text);
                if (res) {
                  setState(() {
                    this.res.text = "Clave no se encuentra";
                  });
                } else {
                  setState(() {
                    this.res.text =
                        "Se ah enviado un correo con instrucciones.";
                  });
                }
                print("probando");
              }),
        ],
      ),
    );
  }
}
