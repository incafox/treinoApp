import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treino/states/agregarSolicitudClase.dart';
import 'package:treino/states/classDetail.dart';

class ClassDetail extends StatefulWidget {
  @override
  _ClassDetailState createState() => _ClassDetailState();
}

class _ClassDetailState extends State<ClassDetail> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   shadowColor: Colors.transparent,
      //   backgroundColor: Colors.transparent,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GradientAppBar("title"),
            BlocBuilder<ClassDetailCubit, dynamic>(
              builder: (context, res) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    // Text(res['nombreGimnasio'],
                    //     style: TextStyle(color: Colors.black54, fontSize: 22)),
                    // Text(res['nombreCategoria'],
                    // style: TextStyle(color: Colors.black54, fontSize: 22)),
                    Text('Nombre de gimnasio: ' + res['nombre'],
                        style: TextStyle(color: Colors.black54, fontSize: 18)),
                    Text('Duracion :' + res['duracion'],
                        style: TextStyle(color: Colors.black54, fontSize: 18)),
                    Text('Horario :' + res['horario'],
                        style: TextStyle(color: Colors.black54, fontSize: 18)),
                    Text('Que Traer :' + res['queTraer'],
                        style: TextStyle(color: Colors.black54, fontSize: 18)),
                    // Image.network(res['galeria1'])
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: [
                      // Text(
                      //   "Acerca de la Clase",
                      //   style:
                      //       TextStyle(color: Colors.blueAccent, fontSize: 22),
                      // ),
                      // Text(
                      //   """Thermobike es una bicicleta fija dentro de una cabina que brinda luz infrerroja mientras ejercitas. Entrenamiento de cardio resistencia y terapeutico que ayuda""",
                      //   style: TextStyle(color: Colors.black54, fontSize: 22),
                      //   textAlign: TextAlign.center,
                      // ),
                      // Text(
                      //   "Categoria",
                      //   style:
                      //       TextStyle(color: Colors.blueAccent, fontSize: 22),
                      // ),
                      // Text(
                      //   "Cycling, Wellness",
                      //   style: TextStyle(color: Colors.black54, fontSize: 22),
                      // ),
                      // Text(
                      //   "Maestro",
                      //   style:
                      //       TextStyle(color: Colors.blueAccent, fontSize: 22),
                      // ),
                      // Text(
                      //   " - ",
                      //   style: TextStyle(color: Colors.black54, fontSize: 22),
                      // ),
                      // Text(
                      //   "Que traer",
                      //   style:
                      //       TextStyle(color: Colors.blueAccent, fontSize: 22),
                      // ),
                      // Text(
                      //   "indispensable toalla, ropa comoda y ligera, tenis, agua y si gustas un cambio",
                      //   style: TextStyle(color: Colors.black54, fontSize: 22),
                      // ),
                      Text(
                        "Es indispensable traer identificacion oficial para poder ingresar",
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              // padding: EdgeInsets.only(top: statusbarHeight),
              height: 200,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      "Servicios",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                  Row(
                      //crossAxisCount: 4,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          foregroundColor: Colors.blue,
                                          child: Stack(
                                            children: <Widget>[
                                              Opacity(
                                                opacity: 0.0,
                                                child: Container(
                                                    decoration: new BoxDecoration(
                                                        color: Colors.blue,
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    100)))),
                                              ),
                                              Center(
                                                child: Icon(
                                                  Icons.water_damage,
                                                  size: 40,
                                                ),
                                              ),
                                            ],
                                          ),
                                          radius: 40,
                                          backgroundImage: null)
                                      // NetworkImage(
                                      //     'https://cdn3.vectorstock.com/i/1000x1000/96/87/dumbbell-in-gym-icon-isolated-contour-vector-28379687.jpg')),
                                      ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "data",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          foregroundColor: Colors.blue,
                                          child: Stack(
                                            children: <Widget>[
                                              Opacity(
                                                opacity: 0.0,
                                                child: Container(
                                                    decoration: new BoxDecoration(
                                                        color: Colors.blue,
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    100)))),
                                              ),
                                              Center(
                                                child: Icon(
                                                  Icons.lock_outline_rounded,
                                                  size: 40,
                                                ),
                                              ),
                                            ],
                                          ),
                                          radius: 40,
                                          backgroundImage: null)
                                      // NetworkImage(
                                      //     'https://cdn3.vectorstock.com/i/1000x1000/96/87/dumbbell-in-gym-icon-isolated-contour-vector-28379687.jpg')),
                                      ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "data",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          foregroundColor: Colors.blue,
                                          child: Stack(
                                            children: <Widget>[
                                              Opacity(
                                                opacity: 0.0,
                                                child: Container(
                                                    decoration: new BoxDecoration(
                                                        color: Colors.blue,
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    100)))),
                                              ),
                                              Center(
                                                child: Icon(
                                                  Icons.person,
                                                  size: 40,
                                                ),
                                              ),
                                            ],
                                          ),
                                          radius: 40,
                                          backgroundImage: null)
                                      // NetworkImage(
                                      //     'https://cdn3.vectorstock.com/i/1000x1000/96/87/dumbbell-in-gym-icon-isolated-contour-vector-28379687.jpg')),
                                      ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "data",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Column(
                              children: [
                                Center(
                                    child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.blue,
                                        child: Stack(
                                          children: <Widget>[
                                            Opacity(
                                              opacity: 0.0,
                                              child: Container(
                                                  decoration: new BoxDecoration(
                                                      color: Colors.blue,
                                                      borderRadius:
                                                          new BorderRadius.all(
                                                              Radius.circular(
                                                                  100)))),
                                            ),
                                            Center(
                                              child: Icon(
                                                Icons
                                                    .label_important_outline_rounded,
                                                size: 40,
                                              ),
                                            ),
                                          ],
                                        ),
                                        radius: 40,
                                        backgroundImage: null)
                                    // NetworkImage(
                                    //     'https://cdn3.vectorstock.com/i/1000x1000/96/87/dumbbell-in-gym-icon-isolated-contour-vector-28379687.jpg')),
                                    ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "data",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ]),
                ],
              ),
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(20),
                //     bottomRight: Radius.circular(20)),
                gradient: LinearGradient(
                    colors: [const Color(0xff13e860), Color(0xbf0781e5)],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(0.9, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "Acerca de la Clase",
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 22),
                      ),
                      Text(
                        """Thermobike es una bicicleta fija dentro de una cabina que brinda luz infrerroja mientras ejercitas. Entrenamiento de cardio resistencia y terapeutico que ayuda""",
                        style: TextStyle(color: Colors.black54, fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Categoria",
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 22),
                      ),
                      Text(
                        "Cycling, Wellness",
                        style: TextStyle(color: Colors.black54, fontSize: 22),
                      ),
                      // Text(
                      //   "Maestro",
                      //   style:
                      //       TextStyle(color: Colors.blueAccent, fontSize: 22),
                      // ),
                      // Text(
                      //   "Jaimito",
                      //   style: TextStyle(color: Colors.black54, fontSize: 22),
                      // ),
                      Text(
                        "Que traer",
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 22),
                      ),
                      Text(
                        "indispensable toalla, ropa comoda y ligera, tenis, agua y si gustas un cambio",
                        style: TextStyle(color: Colors.black54, fontSize: 22),
                      ),
                      Text(
                        "Es indispensable traer identificacion oficial para poder ingresar",
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 22),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
            ),
            RaisedButton(
                child: Text(
                  "Reservar",
                  style: TextStyle(color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(28.0),
                    side: BorderSide(color: Color(0xbf0781e5))),
                color: Color(0xbf0781e5),
                onPressed: () async {
                  bool rpta = false;
                  showAlertDialog(context, Stream.value(rpta));
                  rpta = await context
                      .bloc<AgregarSolicitudCubit>()
                      .agregarSolicitud();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) =>  ),
                  // );
                  print("probando");
                })
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, Stream def) async {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Estado"),
      content: Text("suscripcion exitosa"),
      actions: [
        okButton,
      ],
    );

    AlertDialog cargando = AlertDialog(
      title: Text("Estado"),
      content: Text("enviando suscripcion"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StreamBuilder(
            stream: def,
            builder: (context, snap) {
              if (snap.data == true) {
                print("tu vieja");
                return alert;
              } else {
                print("la tuya");
                return cargando;
              }
            });
      },
    );
  }
}

class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 240.0;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return BlocBuilder<ClassDetailCubit, dynamic>(
        builder: (context, detail) => detail != null
            ? Container(
                height: statusbarHeight + barHeight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 38,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Center(
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
                                                        new BorderRadius.all(
                                                            Radius.circular(
                                                                100)))),
                                          ),
                                          Center(
                                            child: Text("",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 25)),
                                          ),
                                        ],
                                      ),
                                      radius: 65,
                                      backgroundImage:
                                          detail['logotipo'] != null
                                              ? NetworkImage(detail['logotipo'])
                                              : null),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Center(
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 75.0),
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Saasil fit",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Termobike",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ]),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  gradient: LinearGradient(
                      colors: [const Color(0xff13e860), Color(0xbf0781e5)],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(0.9, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
              )
            : Text("data"));
  }
}
