import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treino/states/externalControlTab.dart';
import 'package:treino/states/getSolicitudes.dart';
import 'package:treino/states/getSolicitudesPasadas.dart';

class TabMisClases extends StatefulWidget {
  @override
  _TabMisClasesState createState() => _TabMisClasesState();
}

bool controlClasesVista = false;

class _TabMisClasesState extends State<TabMisClases> {
  Widget reservadas(BuildContext context) {
    return BlocBuilder<SolicitudesCubit, List<dynamic>>(
      builder: (context, items) => items != null
          ? Column(
              children: items.map((e) => Text(e['numeroControl'])).toList(),
            )
          : Text("cargando"),
    );
  }

  Widget pasadas(BuildContext context) {
    return BlocBuilder<SolicitudesPasadasCubit, List<dynamic>>(
      builder: (context, items) => items != null
          ? Column(
              children: items.map((e) => Text(e['numeroControl'])).toList(),
            )
          : Text("cargando"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return //Demo();
        Scaffold(
      body: Column(
        // physics: BouncingScrollPhysics(),
        children: <Widget>[
          GradientAppBar("a"),
          CustomTabSelector(),
          Container(
            color: Colors.grey[400],
            width: double.infinity,
            child: Wrap(
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              spacing: 40,
              children: [
                Text(
                  "No. de control",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                Text(
                  "Valor Total",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                Text(
                  "Estatus",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ],
            ),
          ),
          BlocBuilder<ExternalControllerMisClasesCubit, int>(
              builder: (context, val) =>
                  val == 1 ? this.reservadas(context) : this.pasadas(context)),
        ],
      ),
    );
  }
}

class CustomTabSelector extends StatefulWidget {
  // final bool control;
  // CustomTabSelector({this.control});
  @override
  _CustomTabSelectorState createState() => new _CustomTabSelectorState();
}

class _CustomTabSelectorState extends State<CustomTabSelector> {
  Color def1 = Colors.white;
  Color def1font = Colors.blue;
  Color def2 = Colors.blue;
  Color def2font = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Padding(
        // used padding just for demo purpose to separate from the appbar and the main content
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.topCenter,
          child: Container(
              height: 38,
              padding: EdgeInsets.all(3.5),
              width: MediaQuery.of(context).size.width * 1.2,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(27)),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Align(
                    alignment: Alignment.centerLeft,
                    child: RaisedButton(
                        color: this.def1,
                        // height: double.infinity,
                        onPressed: () {
                          context
                              .bloc<ExternalControllerMisClasesCubit>()
                              .setVal(1);
                          setState(() {
                            this.def1 = Colors.white;
                            this.def1font = Colors.blue;
                            this.def2 = Colors.blue;
                            this.def2font = Colors.white;
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(28.0),
                            side: BorderSide(color: Colors.blue)),
                        child: Container(
                          // margin: EdgeInsets.all(1),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: this.def1,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                  topLeft: Radius.circular(12))),
                          child: Text("Referrals",
                              style: TextStyle(
                                color: this.def1font,
                                fontSize: 17,
                              )),
                        )),
                  )),
                  Expanded(
                      child: RaisedButton(
                          color: this.def2,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(28.0),
                              side: BorderSide(color: Colors.blue)),
                          onPressed: () {
                            context
                                .bloc<ExternalControllerMisClasesCubit>()
                                .setVal(2);
                            setState(() {
                              this.def1 = Colors.blue;
                              this.def1font = Colors.white;
                              this.def2 = Colors.white;
                              this.def2font = Colors.blue;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: this.def2,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(12),
                                    topLeft: Radius.circular(12),
                                    bottomLeft: Radius.circular(12),
                                    topRight: Radius.circular(12))),
                            child: Text("Referrals",
                                style: TextStyle(
                                  color: this.def2font,
                                  fontSize: 17,
                                )),
                          ))),
                ],
              )),
        ));
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
          // IconButton(
          //     icon: Icon(
          //       Icons.arrow_back_ios,
          //       size: 38,
          //       color: Colors.white,
          //     ),
          //     onPressed: null),
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
