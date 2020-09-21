import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TabBuscarClase extends StatefulWidget {
  @override
  _TabBuscarClaseState createState() => _TabBuscarClaseState();
}

class _TabBuscarClaseState extends State<TabBuscarClase> {
  var gradesRange = RangeValues(0, 5);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: GradientAppBar("buscando"),
          ),
          Expanded(
            child: Container(
              // height: double.infinity,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Center(
                        child: Text(
                      "UBICACION",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.blue,
                          decorationColor: Colors.blue),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Form(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(hintText: "Ciudad"),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: "Distancia"),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: "Zona"),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          // Add TextFormFields and RaisedButton here.
                        ])),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Center(
                        child: Text(
                      "HORARIO",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.blue,
                          decorationColor: Colors.blue),
                    )),
                  ),
                  RangeSlider(
                    min: 0,
                    max: 5,
                    divisions: 5,
                    labels: RangeLabels(
                        '${gradesRange.start}', '${gradesRange.end}'),
                    values: gradesRange,
                    onChanged: (RangeValues value) {
                      setState(() {
                        gradesRange = value;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                        child: Text(
                      "DETALLES DE CLASE",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.blue,
                          decorationColor: Colors.blue),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Form(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                          TextFormField(
                            decoration:
                                InputDecoration(hintText: "Actividades"),
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                        child: Text(
                      "SERVICIOS",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.blue,
                          decorationColor: Colors.blue),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.lightGreen[300],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                height: 50,
                                width: 50,
                                // color: Colors.lightGreen[300],
                                child: Center(
                                    child: Icon(Icons.battery_charging_full,
                                        color: Colors.white))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.lightGreen[300],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                height: 50,
                                width: 50,
                                // color: Colors.lightGreen[300],
                                child: Center(
                                    child: Icon(Icons.lock_open,
                                        color: Colors.white))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.lightGreen[300],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                height: 50,
                                width: 50,
                                // color: Colors.lightGreen[300],
                                child: Center(
                                    child: Icon(
                                  Icons.view_carousel,
                                  color: Colors.white,
                                ))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.lightGreen[300],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                height: 50,
                                width: 50,
                                // color: Colors.lightGreen[300],
                                child: Center(
                                    child: Icon(Icons.not_listed_location,
                                        color: Colors.white))),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
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

    return Container(
      padding: EdgeInsets.only(top: statusbarHeight),
      height: statusbarHeight + barHeight,
      child: Row(
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 38,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
                print("object");
              }),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: MaterialButton(
              minWidth: 6,
              onPressed: () {
                print("as");
              },
              child: Center(
                child: Text(
                  "Reiniciar",
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: MaterialButton(
              minWidth: 6,
              onPressed: () {
                print("as");
              },
              child: Center(
                child: Text(
                  "Aplicar",
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
