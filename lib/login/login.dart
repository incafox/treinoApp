import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:treino/recover_password/recover_password.dart';
import 'package:treino/register/signup.dart';
import 'package:treino/Mainmenu/MainMenu.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treino/states/agregarSolicitudClase.dart';
import 'package:treino/states/buyMembresias.dart';
import 'package:treino/states/getSolicitudes.dart';
import 'package:treino/states/getSolicitudesPasadas.dart';
import 'package:treino/states/login/login.dart';
import 'package:treino/states/login/loginstates.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);
  // static final _mainMenuKey = new GlobalKey<_MainMenuState>();

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController correoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // static final _mainMenuKey = new GlobalKey<_MainMenuState>();

  @override
  Widget build(BuildContext context) {
    this.correoController.text = "";
    this.passwordController.text = "";
    return Scaffold(
      // appBar: AppBar(),
      body: Builder(
        builder: (context) => 
          Padding(
          padding: const EdgeInsets.fromLTRB(38.0, 0.0, 38.0, 0.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment(0.0, 1.0),
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
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment(-1, 1),
                    child: Center(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment(0.0, 1.0),
                                  child: TextFormField(
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
                                ), 
                              ),
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child:  TextFormField(
                                  controller: this.passwordController,
                                  decoration: InputDecoration(hintText: "Contrasena"),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                ), 
                                )  
                              ),
                          // Add TextFormFields and RaisedButton here.
                        ])),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: MaterialButton(
                      child: Text("Olvidaste tu contraseña?"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RecoverPasswordPage()),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                  alignment: Alignment(0.0, -1.0),
                  child: BlocConsumer<LoginCubit, LoginCubitState>(
                    listener: (context, state) {
                      if(state is LoginCubitApiError){
                        _notification(context, 'Error de inicio de sesion!. ' + state.error);
                        return;
                      }
                      
                      if(state is LoginCubitRequestError){
                         _notification(context, 'Error de conexion!. Intentole mas tarde');
                        return;
                      }

                      if(state is LoginCubitSuccess){
                        this._success(context);
                        return;
                      }
                      
                    },
                    builder: (context, state) {
                      if(state is LoginCubitLoading || state is LoginCubitSuccess) {
                           return Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 60.0,
                                  padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.blueAccent,
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          );
                      }
                      
                      return Container(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        alignment: Alignment(0.0, 0.0),
                        child: Column(
                        children: [
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
                                  onPressed: () async {
                                    
                                    if(this.correoController.text == '' || this.passwordController.text == ''){
                                        _notification(context, 'Error de inicio de sesion!. Uno o mas campos se encuentran vacios.');
                                        return;
                                    }

                                    await context.bloc<LoginCubit>().loginInto(
                                        correo: this.correoController.text,
                                        password: this.passwordController.text); 
                                    
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
                        ],
                      ) 
                      );
                
                    },
                  ),
                ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }

    void _success(BuildContext context) async{
      bool rpta = false;
      print(context.bloc<LoginCubit>().res);
     //obtiene los clases/solicitudes presentes
      await context
        .bloc<SolicitudesCubit>()
        .getSolicitudes(context.bloc<LoginCubit>().res['id']);
      //id cliente en agregar solicitud
      await context
        .bloc<AgregarSolicitudCubit>()
        .setIdCliente(context.bloc<LoginCubit>().res['id']);

      //obtiene las clases pasadas
      await context
        .bloc<ComprarMembresiasCubit>()
        .setIdCliente(context.bloc<LoginCubit>().res['id']);
        print("id cliente >>> " +
        context.bloc<ComprarMembresiasCubit>().idCliente);
      //pide las clases/solicitudes pasadas
      // await context.bloc<sol>()

      await context
        .bloc<SolicitudesPasadasCubit>()
        .getSolicitudesPasadas(
          context.bloc<LoginCubit>().res['id']);
            if (!rpta) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainMenu()),
                // MaterialPageRoute(builder: (context) => Membresias()),
              );
            }
    }

    void _notification(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
