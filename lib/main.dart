import 'package:flutter/material.dart';
import 'package:treino/login/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

import 'package:treino/states/login.dart';

void main() {
  // Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoginCubit>(
            create: (BuildContext context) => LoginCubit(),
          ),
          // BlocProvider<BlocB>(
          //   create: (BuildContext context) => BlocB(),
          // ),
          // BlocProvider<BlocC>(
          //   create: (BuildContext context) => BlocC(),
          // ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // appBar: AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      // title: Text(widget.title),
      // ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Stack(
          children: <Widget>[
            Image(
                fit: BoxFit.fitHeight,
                height: 800,
                image: AssetImage('assets/images/wallpaper.png')),
            Opacity(
              opacity: 0.7,
              child: Container(
                // height: 400,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Colors.blue, Colors.green],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
                    // LinearGradient(
                    //     colors: [Colors.green, Colors.blueAccent],
                    //     begin: const FractionalOffset(0.0, 0.0),
                    //     end: const FractionalOffset(0.9, 0.0),
                    //     stops: [0.0, 1.0],
                    //     tileMode: TileMode.clamp),
                    ),
              ),
            ),
            Center(
              child: Opacity(
                opacity: 1,
                child: Image(
                    color: Colors.white,
                    colorBlendMode: BlendMode.srcIn,
                    fit: BoxFit.fitWidth,
                    height: 90,
                    width: 180,
                    image: AssetImage('assets/images/Group 2@2x.png')),
              ),
            ),
            Column(
              // horizontal).
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 350,
                ),
                SizedBox(
                  height: 50,
                  width: 120,
                  child: RaisedButton(
                      elevation: 12,
                      child: Text(
                        "Entrar",
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(28.0),
                          side: BorderSide(color: Color(0xff0781e5))),
                      color: Color(0xff0781e5),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                        print("probando");
                      }),
                ),
                // Text(
                //   'You have pushed the button this many times:',
                // ),
                // Text(
                //   '$_counter',
                //   style: Theme.of(context).textTheme.display1,
                // ),
              ],
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
