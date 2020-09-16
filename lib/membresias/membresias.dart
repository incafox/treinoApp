import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treino/Mainmenu/MainMenu.dart';
import 'package:treino/membresias/comprarMembresia.dart';
import 'package:treino/membresias/pagarMembresia.dart';
import 'package:treino/states/buyMembresias.dart';
import 'package:treino/states/membresias.dart';

class Membresias extends StatefulWidget {
  @override
  _MembresiasState createState() => _MembresiasState();
}

class _MembresiasState extends State<Membresias> {
  double fontSize = 20;
  Color white = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Membresías"),
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Cambiar o cancelar tu plan",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: this.fontSize),
              ),
            ),
          ),
          BlocBuilder<MembresiasCubit, List<dynamic>>(
              builder: (context, val) => val != null
                  ? Column(
                      children: val
                          .map((e) => Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: new BorderRadius.only(
                                        topLeft: const Radius.circular(20.0),
                                        topRight: const Radius.circular(20.0),
                                        bottomLeft: const Radius.circular(20.0),
                                        bottomRight:
                                            const Radius.circular(20.0),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        Text(e['nombre'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: white,
                                                fontSize: this.fontSize)),
                                        Divider(
                                          color: white,
                                        ),
                                        Text(
                                          e['descripcion'],
                                          style: TextStyle(
                                              color: white,
                                              fontSize: this.fontSize),
                                        ),
                                        Text(
                                          e['duracion'],
                                          style: TextStyle(
                                              color: white,
                                              fontSize: this.fontSize),
                                        ),
                                        Text(
                                          "Precio : " + e['precio'],
                                          style: TextStyle(
                                              color: white,
                                              fontSize: this.fontSize),
                                        ),
                                        Text(
                                          "Creditos " + e['creditos'],
                                          style: TextStyle(
                                              color: white,
                                              fontSize: this.fontSize),
                                        ),
                                        RaisedButton(
                                            child: Text(
                                              e['creditos'] + " creditos",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: this.fontSize),
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        28.0),
                                                side: BorderSide(
                                                    color: Colors.lightGreen)),
                                            color: Colors.lightGreen,
                                            onPressed: () async{
                                              //actualiza id de membresia a comprar
                                              await context
                                                  .bloc<
                                                      ComprarMembresiasCubit>()
                                                  .setIdMembresia(e['id']);
                                              print("id membresia elegida " +
                                                  e['id']);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PagarMembresia()),
                                              );
                                              print("probando");
                                            }),
                                        RaisedButton(
                                            child: Text(
                                              "\$ " + e['precio'],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: this.fontSize),
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        28.0),
                                                side: BorderSide(
                                                    color: Colors.lightGreen)),
                                            color: Colors.lightGreen,
                                            onPressed: () {
                                              //actualiza id de membresia a comprar
                                              context
                                                  .bloc<
                                                      ComprarMembresiasCubit>()
                                                  .idMembresiaSelected = e['id'];
                                              print("id membresia elegida " +
                                                  e['id']);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PagarMembresia()),
                                              );
                                              print("probando");
                                            })
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    )
                  : Text("cargando membresias")),

          // Padding(
          //   padding: const EdgeInsets.all(18.0),
          //   child: Container(
          //     decoration: BoxDecoration(
          //         color: Colors.blue,
          //         borderRadius: new BorderRadius.only(
          //           topLeft: const Radius.circular(20.0),
          //           topRight: const Radius.circular(20.0),
          //           bottomLeft: const Radius.circular(20.0),
          //           bottomRight: const Radius.circular(20.0),
          //         )),
          //     // color: Colors.blue,
          //     child: Padding(
          //       padding: const EdgeInsets.all(18.0),
          //       child: Column(
          //         children: [
          //           Text("PLAN ACTUAL",
          //               style: TextStyle(
          //                   fontWeight: FontWeight.bold,
          //                   color: white,
          //                   fontSize: this.fontSize)),
          //           Divider(
          //             color: white,
          //           ),
          //           Text("Treino Plus",
          //               style:
          //                   TextStyle(color: white, fontSize: this.fontSize)),
          //           Text(
          //               "Acceso limitado a clases en nuestra red de studios TREINO PLUS, hasta 4 visitas al mes por studio",
          //               style:
          //                   TextStyle(color: white, fontSize: this.fontSize)),
          //           Text("\$1,400",
          //               style:
          //                   TextStyle(color: white, fontSize: this.fontSize)),
          //           RaisedButton(
          //               child: Text(
          //                 "Cambiar mi plan",
          //                 style: TextStyle(
          //                     color: Colors.white, fontSize: this.fontSize),
          //               ),
          //               shape: RoundedRectangleBorder(
          //                   borderRadius: new BorderRadius.circular(28.0),
          //                   side: BorderSide(color: Colors.lightGreen)),
          //               color: Colors.lightGreen,
          //               onPressed: () {
          //                 Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                       builder: (context) => PagarMembresia()),
          //                 );
          //                 print("probando");
          //               })
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("cambiar o cancelar tu plan",
                  style:
                      TextStyle(color: Colors.blue, fontSize: this.fontSize)),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(18.0),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       // color: Colors.,
          //       borderRadius: BorderRadius.circular(20),
          //       // boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
          //     ),
          //     child: ClipRRect(
          //       borderRadius: BorderRadius.circular(20),
          //       child: Container(
          //         padding: EdgeInsets.all(20),
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(20),
          //           border: Border.all(width: 3, color: Colors.blue),
          //         ),
          //         child: Column(
          //           children: [
          //             Text("Treino Pro".toUpperCase(),
          //                 style: TextStyle(
          //                     color: Colors.blue,
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: this.fontSize)),
          //             Divider(),
          //             Text(
          //                 "Acceso limitado a clases en nuestra red de studios TREINO PLUS, hasta 4 visitas al mes por studio",
          //                 style: TextStyle(
          //                     color: Colors.blue, fontSize: this.fontSize)),
          //             Text("\$1,400",
          //                 style: TextStyle(
          //                     color: Colors.blue, fontSize: this.fontSize)),
          //             RaisedButton(
          //                 child: Text(
          //                   "Cambiar mi plan",
          //                   style: TextStyle(
          //                       color: Colors.white, fontSize: this.fontSize),
          //                 ),
          //                 shape: RoundedRectangleBorder(
          //                     borderRadius: new BorderRadius.circular(28.0),
          //                     side: BorderSide(color: Colors.lightGreen)),
          //                 color: Colors.lightGreen,
          //                 onPressed: () {
          //                   Navigator.push(
          //                     context,
          //                     MaterialPageRoute(
          //                         builder: (context) => PagarMembresia()),
          //                   );
          //                   print("probando");
          //                 })
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Container(
              width: 200,
              child: RaisedButton(
                  // minWidth: 100,
                  child: Text(
                    "Cancelar mi plan",
                    style:
                        TextStyle(fontSize: this.fontSize, color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(28.0),
                      side: BorderSide(color: Color(0xbf0781e5))),
                  color: Color(0xbf0781e5),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainMenu()),
                    );
                    print("probando");
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
