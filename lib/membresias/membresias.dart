import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:treino/Mainmenu/MainMenu.dart';


class Membresias extends StatefulWidget {
  @override
  _MembresiasState createState() => _MembresiasState();
}

class _MembresiasState extends State<Membresias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("adasd"),
      ),
      body: Column(
        children: [
          Card(
            child: Text("Treino Plus"),
          ),
          Card(
            child: Text("Treino Plus"),
          ),
          Row(
            children: [
              Icon(Icons.art_track),
              Icon(Icons.art_track),
            ],
          ),
          RaisedButton(
              child: Text(
                "Continuar",
                style: TextStyle(color: Colors.white),
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
        ],
      ),
    );
  }
}
