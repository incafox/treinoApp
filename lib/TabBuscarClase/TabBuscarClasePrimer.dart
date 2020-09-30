// import 'dart:html';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:treino/TabBuscarClase/TabBuscarClasePrimerSub.dart';
import 'package:treino/classdetail/ClassDetail.dart';
import 'package:treino/loaders/minimal_loader.dart';
import 'package:treino/states/agregarSolicitudClase.dart';
import 'package:treino/states/classesPerGym.dart';
import 'package:treino/states/externalControlTab.dart';
import 'package:treino/states/gym_coordinates.dart';
import 'package:treino/states/gymsPerCategory.dart';
import 'package:treino/states/login/login.dart';
import 'TabBuscarClase.dart';
import 'TabBuscarMap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert' show jsonDecode, jsonEncode, utf8;

class TabBuscarClasePrimer extends StatefulWidget {
  @override
  _TabBuscarClasePrimerState createState() => _TabBuscarClasePrimerState();
}

class _TabBuscarClasePrimerState extends State<TabBuscarClasePrimer> {
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
    return BlocBuilder<GymsPerCategoryCubit, List<dynamic>>(
        builder: (context, val) => val != null
            ? Container(
                color: Colors.grey[200],
                child: Column(
                  // crossAxisCount: val.length,
                  children: val
                      .map((e) => Column(
                            children: [
                              e['nombreCiudad'] ==
                                      context.bloc<LoginCubit>().res['ciudad']
                                  ? MaterialButton(
                                      onPressed: () {
                                        print("hacia ");
                                        print("hacia " + e['idGym'].toString());
                                        print("lat " + e['latitud'].toString());
                                        print(
                                            "long " + e['longitud'].toString());
                                        context
                                            .bloc<CoordinatesCubit>()
                                            .setCoordinates(
                                                e['latitud'], e['longitud']);
                                        context
                                            .bloc<ClassesPerGymCubit>()
                                            .getClassesByGym(e['idGym']);
                                        context
                                            .bloc<AgregarSolicitudCubit>()
                                            .setIdGym(e['idGym']);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TabBuscarClasePrimerSub()),
                                        );
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5.0),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          color: Colors.grey[200],
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              children: [
                                                Text((e['nombreGym']),
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign:
                                                        TextAlign.center),
                                                Container(
                                                  height: 5,
                                                ),
                                                Text(
                                                  (e['informacion']),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text(e['direccion'],
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign:
                                                        TextAlign.center),
                                                Text(e['nombreCiudad'],
                                                    textAlign:
                                                        TextAlign.center),
                                                // Divider()
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                              Container(
                                height: 10,
                                color: Colors.white,
                                width: MediaQuery.of(context).size.width,
                              )
                            ],
                          ))
                      .toList(),
                ),
              )
            : MinimalLoader());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // scrollDirection: Axis.vertical,
          // physics: BouncingScrollPhysics(),
          children: <Widget>[
            Container(
              child: GradientAppBar("buscando"),
            ),
            // dias(),
            // semana(),
            Container(
              color: Colors.grey[400],
              width: double.infinity,
              child: Text(
                "Gimnasios Disponibles",
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
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(
                      context,
                      // new ClassDetail(),
                    );
                  }),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Center(
                          child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                              )),
                          Expanded(
                            flex: 10,
                            child: Container(
                              child: TextField(
                                cursorColor: Colors.black,
                                // keyboardType: inputType,
                                decoration: InputDecoration(
                                  hintText: "Buscar Gimnasio",
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 11, top: 5, right: 15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                    ),
                    height: 35,
                    // width: 250,
                    decoration: BoxDecoration(
                        // border:,
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                  ),
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(5.0),
          //   child: MaterialButton(
          //     minWidth: 6,
          //     onPressed: () {
          //       // context.bloc<ClassesPerGymCubit>().getClassesByGym(idGym)
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => TabBuscarMap()),
          //         // new ClassDetail(),
          //       );
          //       print("as");
          //     },
          //     child: Center(
          //         child: Icon(
          //       Icons.place,
          //       size: 40,
          //       color: Colors.white,
          //     )),
          //   ),
          // ),
          Expanded(
            flex: 1,
            child: Container(
              child: Padding(
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
                    // size: 20,
                    color: Colors.white,
                  )),
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
