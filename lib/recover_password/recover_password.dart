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
                    margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    child: Icon(
                      Icons.email,
                      color: Color(0xbf0781e5),
                      size: 80.0,
                    ),
                  ), 
                ),
               Expanded(
                 flex: 1,
                 child: Column(
                   children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 40.0),
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
                   ],
                 ) 
                 
               
               ),
               Expanded(
                 flex: 1,
                 child: Text('')
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


