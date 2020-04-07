import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(38.0),
        child: Container(
          child: Column(
            children: <Widget>[
              Text(
                "treino",
                style: TextStyle(fontSize: 40),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(hintText: "Correo electronico"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(hintText: "Contrasena"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      )
                      // Add TextFormFields and RaisedButton here.
                    ])),
              ),
              Center(
                child: MaterialButton(
                  child: Text("Olvidaste tu clave?"),
                  onPressed: () {
                    print("entrando");
                  },
                ),
              ),
              RaisedButton(
                  child: Text(
                    "Iniciar Sesion",
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(28.0),
                      side: BorderSide(color: Colors.blue)),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                    print("probando");
                  }),
              RaisedButton(
                  child: Text(
                    "Crear Cuenta",
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(28.0),
                      side: BorderSide(color: Colors.blue)),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                    print("probando");
                  })
            ],
          ),
        ),
      ),
    );
  }
}
