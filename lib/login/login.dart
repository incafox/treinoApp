import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:treino/register/signup.dart';
import 'package:treino/Mainmenu/MainMenu.dart';
import 'package:treino/membresias/membresias.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treino/states/login.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController correoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(38.0),
        child: Container(
          child: ListView(
            children: <Widget>[
              Center(
                child: Opacity(
                  opacity: 1,
                  child: Image(
                      // color: Colors.white,
                      // colorBlendMode: BlendMode.srcIn,
                      fit: BoxFit.fitWidth,
                      height: 90,
                      width: 180,
                      image: AssetImage('assets/images/Path 8@2x.png')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                      TextFormField(
                        controller: this.correoController,
                        decoration:
                            InputDecoration(hintText: "Correo electronico"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: this.passwordController,
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
              // Container(
              //   height: 100,
              // ),
              Container(
                width: 200,
                child: RaisedButton(
                    child: Text(
                      "Iniciar Sesion",
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(28.0),
                        side: BorderSide(color: Color(0xff13e860))),
                    color: Color(0xff13e860),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainMenu()),
                        // MaterialPageRoute(builder: (context) => Membresias()),
                      );
                      context.bloc<LoginCubit>().loginInto(
                          correo: this.correoController.text,
                          password: this.passwordController.text);
                      print("probansdsdo");
                    }),
              ),
              Container(
                width: 200,
                child: RaisedButton(
                    child: Text(
                      "Crear Cuenta",
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(28.0),
                        side: BorderSide(color: Color(0xbf0781e5))),
                    color: Color(0xbf0781e5),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                      print("probando");
                    }),
              ),
              // Container(
              //   height: 10,
              //   child: BlocBuilder<CounterCubit, int>(
              //     builder: (context, count) => Center(child: Text('$count')),
              //   ),
              // ),

              // MaterialButton(
              //     child: Text("data"),
              //     onPressed: () => context.bloc<LoginCubit>().loginInto(
              //         this.correoController.text, this.passwordController.text))
            ],
          ),
        ),
      ),
    );
  }
}
