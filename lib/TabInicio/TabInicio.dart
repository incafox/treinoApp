import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:treino/loaders/minimal_loader.dart';
import 'package:treino/states/categories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treino/states/gymsPerCategory.dart';

class TabInicio extends StatefulWidget {
  final TabController tabCcontroller;
  TabInicio(this.tabCcontroller);
  @override
  _TabInicioState createState() => _TabInicioState();
}

class _TabInicioState extends State<TabInicio> {
  // final GlobalKey<_MainMenuState> counterKey;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '0',
                            style: TextStyle(fontSize: 19, color: Colors.white),
                          ),
                          Text(
                            'Reservadas',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ))),
                  Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '0',
                            style: TextStyle(fontSize: 19, color: Colors.white),
                          ),
                          Center(
                              child: Text('Asistidas',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white))),
                        ],
                      )),
                ],
              ),
              color: Colors.grey[400],
            ),
          ),
          Container(
            height: 20,
            color: Colors.white,
          ),
          BlocBuilder<CategoriesCubit, List<dynamic>>(
              builder: (context, val) => val != null
                  ? Wrap(
                      children: val
                          .map((e) => Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FlatButton(
                                  onPressed: () {
                                    // int idCategoria = int.parse(e["id"]);
                                    print("Categoria > " + e["id"]);
                                    context
                                        .bloc<GymsPerCategoryCubit>()
                                        .setIdCategoria(e["id"]);
                                    context
                                        .bloc<GymsPerCategoryCubit>()
                                        .reset();
                                    context
                                        .bloc<GymsPerCategoryCubit>()
                                        .getGymByCategoria(e['id']);
                                    widget.tabCcontroller.animateTo(1);
                                    // widget.keyController.currentState.
                                    // context
                                    //     .bloc<
                                    //         ExternalControllerMainTabsCubit>()
                                    //     .tabber
                                    //     .animateTo(2);
                                    print("----");
                                    print(e);
                                    print("----");
                                  },
                                  child: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(e['imagen']),
                                      radius: 75,
                                      child: Stack(
                                        children: <Widget>[
                                          Opacity(
                                            opacity: 0.5,
                                            child: Container(
                                                // width: 80,height: 80,
                                                decoration: new BoxDecoration(
                                                    color: Color(0xef0763e5),
                                                    borderRadius:
                                                        new BorderRadius.all(
                                                            Radius.circular(
                                                                100)))),
                                          ),
                                          Center(
                                            child: Text(e['nombre'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25)),
                                          ),
                                        ],
                                      )),
                                ),
                              ))
                          .toList(),
                    )
                  : MinimalLoader()),
          // Wrap(
          //     // crossAxisCount: 2,
          //     children: context
          //         .bloc<CategoriesCubit>()
          //         .items
          //         .map((e) => Padding(
          //               padding: const EdgeInsets.all(4.0),
          //               child: ,
          //             ))
          //         .toList()

          // <Widget>[
          //   Container(
          //     width: 200,
          //     height: 200,
          //     child: MaterialButton(
          //       // minWidth: 180,height: 180,
          //       onPressed: () {
          //         print("sasa");
          //       },
          //       child: CircleAvatar(
          //           // minRadius: 10,
          //           foregroundColor: Colors.green,
          //           child: Stack(
          //             children: <Widget>[
          //               Opacity(
          //                 opacity: 0.5,
          //                 child: Container(
          //                     // width: 80,height: 80,
          //                     decoration: new BoxDecoration(
          //                         color: Color(0xef0781e5),
          //                         borderRadius:
          //                             new BorderRadius.all(
          //                                 Radius.circular(100)))),
          //               ),
          //               Center(
          //                 child: Text("Diversion",
          //                     style: TextStyle(
          //                         color: Colors.white,
          //                         fontSize: 25)),
          //               ),
          //             ],
          //           ),
          //           radius: 80,
          //           backgroundImage: AssetImage(
          //               'assets/images/circles/Intersection 7@3x.png')),
          //     ),
          //   ),
          //   Padding(
          //     padding: const EdgeInsets.all(1.0),
          //     child: Container(
          //       width: 200,
          //       height: 200,
          //       child: MaterialButton(
          //         onPressed: () {
          //           print("asa");
          //         },
          //         child: CircleAvatar(
          //             foregroundColor: Colors.green,
          //             child: Stack(
          //               children: <Widget>[
          //                 Opacity(
          //                   opacity: 0.5,
          //                   child: Container(
          //                       decoration: new BoxDecoration(
          //                           color: Color(0xef0781e5),
          //                           borderRadius:
          //                               new BorderRadius.all(
          //                                   Radius.circular(100)))),
          //                 ),
          //                 Center(
          //                   child: Text("Yoga",
          //                       style: TextStyle(
          //                           color: Colors.white,
          //                           fontSize: 25)),
          //                 ),
          //               ],
          //             ),
          //             radius: 80,
          //             backgroundImage: AssetImage(
          //                 'assets/images/circles/Intersection 4@3x.png')),
          //       ),
          //     ),
          //   ),
          //   Padding(
          //     padding: const EdgeInsets.all(1.0),
          //     child: Container(
          //       width: 200,
          //       height: 200,
          //       child: MaterialButton(
          //         onPressed: () {
          //           print("asd");
          //         },
          //         child: CircleAvatar(
          //             foregroundColor: Colors.green,
          //             child: Stack(
          //               children: <Widget>[
          //                 Opacity(
          //                   opacity: 0.5,
          //                   child: Container(
          //                       decoration: new BoxDecoration(
          //                           color: Color(0xef0781e5),
          //                           borderRadius:
          //                               new BorderRadius.all(
          //                                   Radius.circular(100)))),
          //                 ),
          //                 Center(
          //                   child: Text("Cardio",
          //                       style: TextStyle(
          //                           color: Colors.white,
          //                           fontSize: 25)),
          //                 ),
          //               ],
          //             ),
          //             radius: 80,
          //             backgroundImage: AssetImage(
          //                 'assets/images/circles/Intersection 5@3x.png')),
          //       ),
          //     ),
          //   ),
          //   Padding(
          //     padding: const EdgeInsets.all(1.0),
          //     child: Container(
          //       width: 200,
          //       height: 200,
          //       child: MaterialButton(
          //         // minWidth: 290,

          //         // shape: RoundedRectangleBorder(
          //         //     borderRadius: new BorderRadius.circular(100.0),
          //         //     side: BorderSide(color: Colors.white)),
          //         // color: Colors.white,
          //         onPressed: () {
          //           print("asda");
          //         },
          //         child: CircleAvatar(
          //             foregroundColor: Colors.green,
          //             child: Stack(
          //               children: <Widget>[
          //                 Opacity(
          //                   opacity: 0.5,
          //                   child: Container(
          //                       decoration: new BoxDecoration(
          //                           color: Color(0xef0781e5),
          //                           borderRadius:
          //                               new BorderRadius.all(
          //                                   Radius.circular(80)))),
          //                 ),
          //                 Center(
          //                   child: Text("Fuerza",
          //                       style: TextStyle(
          //                           color: Colors.white,
          //                           fontSize: 25)),
          //                 ),
          //               ],
          //             ),
          //             radius: 80,
          //             backgroundImage: AssetImage(
          //                 'assets/images/circles/Intersection 6@3x.png')),
          //       ),
          //     ),
          //   ),
          //   Container(
          //     height: 200,
          //     color: Colors.white,
          //   )
          // ],
          // ),
          // Container(
          //   height: 200,
          //   color: Colors.white,
          // )
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
              'https://picsum.photos/250?image=9',
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
