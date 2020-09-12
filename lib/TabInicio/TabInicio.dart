import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TabInicio extends StatefulWidget {
  @override
  _TabInicioState createState() => _TabInicioState();
}

class _TabInicioState extends State<TabInicio> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // appBar: PreferredSize(
      //   preferredSize: Size(100, 60),
      //   child: AppBar(

      //     backgroundColor: Colors.grey[400],
      //     title: Text("adsa")
      //   ),
      // ),
      child: Column(
        // physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              height: 45,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Center(
                          child: Column(
                    children: [
                      Text(
                        '0',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        'Reservadas',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ))),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        '0',
                        style: TextStyle(fontSize: 20, color: Colors.white),
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
          Padding(
            padding: const EdgeInsets.only(top:10.0),
            child: Center(
              child: Column(
                // crossAxisCount: 2,
                children: <Widget>[
                  // GestureDetector(
                  //   child: Hero(
                  //     tag: 'imageHero',
                  //     child: Image.network(
                  //       'https://picsum.photos/250?image=9',
                  //     ),
                  //   ),
                  //   onTap: () {
                  //     Navigator.push(context, MaterialPageRoute(builder: (_) {
                  //       return DetailScreen();
                  //     }));
                  //   },
                  // ),
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Container(
                            width: 200,
                            height: 200,
                            child: MaterialButton(
                              // minWidth: 180,height: 180,
                              onPressed: () {
                                
                                print("sasa");
                              },
                              child: CircleAvatar(
                                  // minRadius: 10,
                                  foregroundColor: Colors.green,
                                  child: Stack(
                                    children: <Widget>[
                                      Opacity(
                                        opacity: 0.5,
                                        child: Container(
                                            // width: 80,height: 80,
                                            decoration: new BoxDecoration(
                                                color: Color(0xef0781e5),
                                                borderRadius:
                                                    new BorderRadius.all(
                                                        Radius.circular(100)))),
                                      ),
                                      Center(
                                        child: Text("Diversion",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25)),
                                      ),
                                    ],
                                  ),
                                  radius: 80,
                                  backgroundImage: AssetImage(
                                      'assets/images/circles/Intersection 7@3x.png')),
                            ),
                          )
                          // NetworkImage('https://via.placeholder.com/140x100')),
                          ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          width: 200,
                          height: 200,
                          child: MaterialButton(
                            onPressed: () {
                              print("asa");
                            },
                            child: CircleAvatar(
                                foregroundColor: Colors.green,
                                child: Stack(
                                  children: <Widget>[
                                    Opacity(
                                      opacity: 0.5,
                                      child: Container(
                                          decoration: new BoxDecoration(
                                              color: Color(0xef0781e5),
                                              borderRadius:
                                                  new BorderRadius.all(
                                                      Radius.circular(100)))),
                                    ),
                                    Center(
                                      child: Text("Yoga",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25)),
                                    ),
                                  ],
                                ),
                                radius: 80,
                                backgroundImage: AssetImage(
                                    'assets/images/circles/Intersection 4@3x.png')),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          width: 200,
                          height: 200,
                          child: MaterialButton(
                            onPressed: () {
                              print("asd");
                            },
                            child: CircleAvatar(
                                foregroundColor: Colors.green,
                                child: Stack(
                                  children: <Widget>[
                                    Opacity(
                                      opacity: 0.5,
                                      child: Container(
                                          decoration: new BoxDecoration(
                                              color: Color(0xef0781e5),
                                              borderRadius:
                                                  new BorderRadius.all(
                                                      Radius.circular(100)))),
                                    ),
                                    Center(
                                      child: Text("Cardio",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25)),
                                    ),
                                  ],
                                ),
                                radius: 80,
                                backgroundImage: AssetImage(
                                    'assets/images/circles/Intersection 5@3x.png')),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          width: 200,
                          height: 200,
                          child: MaterialButton(
                            // minWidth: 290,

                            // shape: RoundedRectangleBorder(
                            //     borderRadius: new BorderRadius.circular(100.0),
                            //     side: BorderSide(color: Colors.white)),
                            // color: Colors.white,
                            onPressed: () {
                              print("asda");
                            },
                            child: CircleAvatar(
                                foregroundColor: Colors.green,
                                child: Stack(
                                  children: <Widget>[
                                    Opacity(
                                      opacity: 0.5,
                                      child: Container(
                                          decoration: new BoxDecoration(
                                              color: Color(0xef0781e5),
                                              borderRadius:
                                                  new BorderRadius.all(
                                                      Radius.circular(80)))),
                                    ),
                                    Center(
                                      child: Text("Fuerza",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25)),
                                    ),
                                  ],
                                ),
                                radius: 80,
                                backgroundImage: AssetImage(
                                    'assets/images/circles/Intersection 6@3x.png')),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Container(
                    height: 200,
                    color: Colors.white,
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
