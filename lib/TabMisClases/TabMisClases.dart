import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TabMisClases extends StatefulWidget {
  @override
  _TabMisClasesState createState() => _TabMisClasesState();
}

class _TabMisClasesState extends State<TabMisClases> {
  Widget opciones() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 30.0,
          mainAxisSpacing: 7.0,
          childAspectRatio: 4.5),
      itemCount: 7,
      itemBuilder: (context, index) {
        return Container(
          height: 40,
          color: Colors.grey[200],
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  // "index: $index",
                  "456765434567",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text("Acceso Libre"),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Text("Acceso Libre"),
                    Text("Sports World"),
                    Text("Maestro : N/A"),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return //Demo();
        Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          GradientAppBar("a"),
          Demo(),
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
          this.opciones()
        ],
      ),
    );
  }
}

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => new _DemoState();
}

class _DemoState extends State<Demo> {
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
              height: 38  ,
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
