import 'package:flutter/material.dart';

class PointPage extends StatefulWidget {
  final String idGym;
  PointPage({this.idGym});
  @override
  _PointPageState createState() => _PointPageState();
}

class _PointPageState extends State<PointPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("test"),
        ),
        body: Column(
          children: [
            Text("Categorias de gimnasio"),
            Container(),
          ],
        ));
  }
}
