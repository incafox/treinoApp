import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:treino/Mainmenu/MainMenu.dart';
import 'package:treino/membresias/teststripe.dart';
import 'package:treino/states/buyMembresias.dart';
import 'package:treino/states/payment.dart';


enum SingingCharacter { lafayette, jefferson }


class PagarMembresia extends StatefulWidget {
  @override
  _PagarMembresiaState createState() => _PagarMembresiaState();
}

class _PagarMembresiaState extends State<PagarMembresia> {
  TextEditingController idMembresia = TextEditingController();
  TextEditingController idCliente = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: GradientAppBar(""), preferredSize: Size.fromHeight(70)),
      body: SingleChildScrollView(
        child: Container(
           padding: const EdgeInsets.all(30),
           child:   Column(
          children: [
            Container(
              height: 32,
              child: Center(
                child: Text("Datos de cuenta",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.blue
                  ),
                )
              ),
            ),
            Container(
              height: 50,
              child: Center(
                child: TextFormField(
                  //controller: this.passwordController,
                  decoration: InputDecoration(hintText: "Nombre del titular"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ), 
              ),
            ),
            Container(
              height: 50,
              child: Center(
                child: TextFormField(
                  //controller: this.passwordController,
                  decoration: InputDecoration(hintText: "Numero de tarjeta"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ), 
              ),
            ),
            Container(
              height: 50,
              child: Center(
                child: TextFormField(
                  //controller: this.passwordController,
                  decoration: InputDecoration(hintText: "Fecha de vencimiento"),
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ), 
              ),
            ),
               Container(
              height: 50,
              child: Center(
                child: TextFormField(
                  //controller: this.passwordController,
                  decoration: InputDecoration(hintText: "Numero de seguridad"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ), 
              ),
            ),
            Container(
              height: 50,
              child:     Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                      padding: const EdgeInsets.only(right: 20),
                      height: 50,
                      child: Center(
                        child: TextFormField(
                          //controller: this.passwordController,
                          decoration: InputDecoration(hintText: "Codigo postal"),
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ), 
                      ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      padding: const EdgeInsets.only(left: 20),
                      height: 50,
                      child: Center(
                        child: TextFormField(
                          //controller: this.passwordController,
                          decoration: InputDecoration(hintText: "Telefono"),
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ), 
                      ),
                  ),
                ),
              ],
            ),
            ),
           
            Container(
              padding: const EdgeInsets.only(top: 10),
              height: 130,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        "Despues de tu periodo establecido, el cargo sera automatico",
                         style: TextStyle(
                          fontSize: 12,
                           color: Colors.grey
                        ),
                      ), 
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                      "Podras cancelar cuando quieras directo en la App hasta 24 hotas antes de tu fecha de corte para evitar la renovacion automatica"
                      ,  style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey
                        ), 
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        "Para poder reservar clases necesiras subir una foto de perfil",
                        style: TextStyle(
                          fontSize: 12,
                           color: Colors.grey
                        ),
                      ), 
                    ), 
                  ]
                ),
              ),
            ),
            Container(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        alignment: Alignment(0.0, 0.0),
                        child: Column(
                        children: [
                            Container(
                              width: 200,
                              child: RaisedButton(
                                  child: Text(
                                    "Obtener membresia",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(28.0),
                                      side: BorderSide(color: Color(0xbf0781e5))),
                                  color: Color(0xbf0781e5),
                                  onPressed: () async {
  
                                    
                                  }),
                            ),
                        ],
                      ) 
                      )
          ],
        ),
        ) 
        
      
      ),
    );
  }

  void comprarMembresia(
      {BuildContext context, String idMembresia, String idCliente}) async {
    // context.bloc<ComprarMembresiasCubit>().idMembresiaSelected = idMembresia;
    // context.bloc<ComprarMembresiasCubit>().idCliente = idCliente;
    await context.bloc<ComprarMembresiasCubit>().comprarMembresia(
        context.bloc<ComprarMembresiasCubit>().idCliente,
        context.bloc<ComprarMembresiasCubit>().idMembresiaSelected);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainMenu()),
    );
  }
}


class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 70.0;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return new Container(
      padding: EdgeInsets.only(top: statusbarHeight),
      height: statusbarHeight + barHeight,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                    );
                  },
                  child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: null),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Pagar",
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [const Color(0xff13e860), Color(0xbf0781e5)],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.9, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
    );
  }
}