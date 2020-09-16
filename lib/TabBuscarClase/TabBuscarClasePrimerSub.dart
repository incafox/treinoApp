// import 'dart:html';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:treino/classdetail/ClassDetail.dart';
import 'package:treino/states/agregarSolicitudClase.dart';
import 'package:treino/states/classesPerGym.dart';
import 'package:treino/states/externalControlTab.dart';
import 'package:treino/states/gymsPerCategory.dart';
import 'TabBuscarClase.dart';
import 'TabBuscarMap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//las clases
class TabBuscarClasePrimerSub extends StatefulWidget {
  @override
  _TabBuscarClasePrimerState createState() => _TabBuscarClasePrimerState();
}

class _TabBuscarClasePrimerState extends State<TabBuscarClasePrimerSub> {
  var gradesRange = RangeValues(0, 7);
  List letras = ["D", "L", "M", "M", "J", "V", "S", "ads"];
  Widget semana() {
    return Container(
      color: Colors.black87,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 1.0,
        ),
        itemCount: 7,
        itemBuilder: (context, index) {
          return RaisedButton(
            color: Color(0xef0781e5),
            onPressed: () {
              print("ads");
            },
            child: Container(
              width: 100,
              color: Colors.transparent,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      letras[index],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      "/",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Widget dias() {
  //   return Wrap(
  //     runAlignment: WrapAlignment.center,
  //     alignment: WrapAlignment.spaceAround,
  //     crossAxisAlignment: WrapCrossAlignment.end,
  //     direction: Axis.horizontal,
  //     children: [
  //       Container(
  //         // width: double.infinity,
  //         color: Colors.blue,
  //         child: Text("M"),
  //       ),
  //       Container(
  //         color: Colors.blue,
  //         child: Text("M"),
  //       ),
  //       Container(
  //         color: Colors.blue,
  //         child: Text("M"),
  //       ),
  //       Container(
  //         color: Colors.blue,
  //         child: Text("M"),
  //       ),
  //       Container(
  //         color: Colors.blue,
  //         child: Text("M"),
  //       ),
  //       Container(
  //         color: Colors.blue,
  //         child: Text("M"),
  //       ),
  //       Container(
  //         color: Colors.blue,
  //         child: Text("M"),
  //       ),
  //     ],
  //   );
  // }

  //para obtener puntos de gym
  //debe ser un builder que tome datos
  //de la rpta de api
  Widget opciones() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 24.0,
          mainAxisSpacing: 7.0,
          childAspectRatio: 4.5),
      itemCount: 7,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.grey[200],
          child: MaterialButton(
            // color: Colors.grey[200],
            // minWidth: double.infinity,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ClassDetail()),
                // new ClassDetail(),
              );
              // print("dasd");
            },
            child: Container(
              // width: ,
              height: 140,
              color: Colors.transparent,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      // "index: $index",
                      "12:00 pm - 120 min",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text("Acceso Libre"),
                  Text("Sports World Prado Sur"),
                  Text("Maestro : N/A"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget opciones2(BuildContext context) {
    return BlocBuilder<ClassesPerGymCubit, List<dynamic>>(
        builder: (context, val) => val != null
            ? Container(
                color: Colors.grey[200],
                child: Column(
                  // crossAxisCount: val.length,
                  children: val
                      .map((e) => FlatButton(
                            onPressed: () {
                              context
                                  .bloc<AgregarSolicitudCubit>()
                                  .setIdClase(e['idClase']);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ClassDetail()),
                              );
                              print("as");
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.grey[200],
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        e['nombreClase'],
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        height: 5,
                                      ),
                                      Text("horario :" + e['horarioClase']),
                                      Text("entrenador :" +
                                          e['nombreEntrenadorClase']),
                                      // Text(e['nombreCategoria']),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              )
            : Text("cargando"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            child: GradientAppBar("buscando"),
          ),
          // dias(),
          semana(),
          Container(
            color: Colors.grey[400],
            width: double.infinity,
            child: Text(
              "YOGA",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
          //     // opciones(),
          //     BlocBuilder<ExternalControllerMisClasesCubit, int>(
          //   builder: (context, val) => val==1? ),
          // ),
          opciones2(context)
        ],
      ),
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
      child: Row(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: TextField(
                    decoration: null,
                  )),
                ),
                height: 35,
                width: 220,
                decoration: BoxDecoration(
                    // border:,
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(5.0),
          //   child: Center(
          //       child: Icon(
          //     Icons.search,
          //     size: 40,
          //     color: Colors.white,
          //   )
          //       // Text(
          //       //   "Search",
          //       //   style: TextStyle(
          //       //       fontSize: 25.0,
          //       //       color: Colors.white,
          //       //       fontWeight: FontWeight.bold),
          //       // ),
          //       ),
          // ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: MaterialButton(
              minWidth: 6,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TabBuscarMap()),
                  // new ClassDetail(),
                );
                print("as");
              },
              child: Center(
                  child: Icon(
                Icons.place,
                size: 40,
                color: Colors.white,
              )
                  // Text(
                  //   "Search",
                  //   style: TextStyle(
                  //       fontSize: 25.0,
                  //       color: Colors.white,
                  //       fontWeight: FontWeight.bold),
                  // ),
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: MaterialButton(
              minWidth: 6,
              onPressed: () {
                print("as");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TabBuscarClase()),
                  // MaterialPageRoute(builder: (context) => Membresias()),
                );
              },
              child: Center(
                  child: Icon(
                Icons.tune,
                size: 40,
                color: Colors.white,
              )
                  // Text(
                  //   "Search",
                  //   style: TextStyle(
                  //       fontSize: 25.0,
                  //       color: Colors.white,
                  //       fontWeight: FontWeight.bold),
                  // ),
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
