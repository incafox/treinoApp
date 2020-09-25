import 'package:flutter/material.dart';
import 'package:treino/states/recoverpass.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecoverPasswordPage extends StatefulWidget {
  @override
  _RecoverPasswordPageState createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> {
  TextEditingController input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) =>
             Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Container(
            child: 
              Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
            children: <Widget>[
              BackButton(),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Center(
                  child: Opacity(
                    opacity: 1,
                    child: Image(
                      fit: BoxFit.fitWidth,
                      height: 90,
                      width: 180,
                      image: AssetImage('assets/images/Path 8@2x.png')),
                  ),
                ),
              ),
            ],
          ),
          ),
          Expanded(
            flex: 3,
            child: 
               Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child:
                   Container(
                    alignment: Alignment(0,-0.5),
                    margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    child: Icon(
                      Icons.email,
                      color: Color(0xbf0781e5),
                      size: 80.0,
                    ),
                  ), 
                ),
                Expanded(
                  flex:  1,
                  child: Container(
                    alignment: Alignment(0.0, -1),
                    margin: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                    child: 
                        Container(
                          margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                          child: Text("Introduce tu correo electronico y te enviaremos las instrucccuines para recuperar tu cuenta", 
                            style: TextStyle( 
                              //fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color(0xbf0781e5),
                              decorationColor: Colors.blue,
                            ),
                          ),
                        )
                  ),
                ),
                Expanded(
                  flex: 1, 
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                    alignment: Alignment(0, -1),
                    child: TextFormField(
                        controller: this.input,
                        decoration: InputDecoration(hintText: "Correo electronico"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment(0.0, -1.0),
                      child:   RaisedButton(
                      child: Text(
                        "Enviar Solicitud",
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(28.0),
                          side: BorderSide(color: Color(0xbf0781e5))),
                      color: Color(0xbf0781e5),
                      onPressed: () async {
                        if(this.input.text == ''){
                          _notification(context, 'Error!. No se ha ingresado un correo electronico');
                          return;
                        }

                        bool res = await context.bloc<RecuperarPasswordCubit>().recuperarPassword(this.input.text);
                        
                        if(res) {
                          this.input.text = '';
                        }

                        String message = res ? 
                          'Se ha enviado las indicaciones de recuperacion a su correo electronico' :
                          'Error!. El correo ingresado es invalido' ;
                       _notification(context, message);     
                      }),
                    )
                  ),
            ],)
          ,),
          ),
        ],
      ),
          )
        ), 
      ), 
    );
  }

  void _notification(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}


