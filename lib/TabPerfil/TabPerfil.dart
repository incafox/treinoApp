import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TabPerfil extends StatefulWidget {
  @override
  _TabPerfilState createState() => _TabPerfilState();
}

class _TabPerfilState extends State<TabPerfil> {
  Widget link(String name) {
    return MaterialButton(
        child: Padding(
          padding: const EdgeInsets.only(left: 19.0, right: 19),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              bottom: 3, // space between underline and text
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.black38, // Text colour here
              width: 1.0, // Underline width
            ))),
            child: Text(
              name,
              style: TextStyle(
                color: Colors.black, // Text colour here
              ),
            ),
          ),
        ),
        onPressed: () {
          print("sasa");
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              GradientAppBar("title"),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Center(
                    child: Text(
                  "DATOS DE CUENTA",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.blue,
                      decorationColor: Colors.blue),
                )),
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: link("Karla Uriarte")),
              Align(alignment: Alignment.bottomLeft, child: link("Membresia")),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: link("Historial de pago")),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: link("Solicita tu factura")),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Center(
                    child: Text(
                  "MAS INFORMACION",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.blue,
                      decorationColor: Colors.blue),
                )),
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: link("Preguntas Frecuentes")),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: link("Terminos y Condiciones")),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: link("Politica de Privacidad")),
              Align(alignment: Alignment.bottomLeft, child: link("Ayuda")),
              Padding(
                padding: const EdgeInsets.only(bottom: 25,top: 17, left: 85, right: 85),
                child: Container(
                  height: 50,
                  width: 40,
                  child: RaisedButton(
                      elevation: 5,
                      child: Text(
                        "Cerrar Sesion",
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(28.0),
                          side: BorderSide(color: Color(0xff0781e5))),
                      color: Color(0xff0781e5),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => Login()),
                        // );
                        print("probando");
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 200.0;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return new Container(
      // padding: EdgeInsets.only(top: statusbarHeight),
      height: statusbarHeight + barHeight,
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: GridView.count(crossAxisCount: 2, children: <Widget>[
          Center(
            child: CircleAvatar(
                foregroundColor: Colors.green,
                child: Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.0,
                      child: Container(
                          decoration: new BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(100)))),
                    ),
                    Center(
                      child: Text("person",
                          style: TextStyle(color: Colors.black, fontSize: 25)),
                    ),
                  ],
                ),
                radius: 65,
                backgroundImage: NetworkImage(
                    'https://okdiario.com/img/2019/09/05/mejores-frases-de-homer-simpson-655x368.jpg')),
          ),
          Center(
            child: Container(
              color: Colors.transparent,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 75.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Karla Uriarte",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "karla@treino.com.mx",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
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
