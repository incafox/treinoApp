import 'package:flutter/material.dart';
import 'package:treino/login/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treino/states/buyMembresias.dart';
import 'package:treino/states/categories.dart';
import 'package:treino/states/classDetail.dart';
import 'package:treino/states/classesPerGym.dart';
import 'package:treino/states/detailGym.dart';
import 'package:treino/states/externalcontroltab/externalControlTab.dart';
import 'package:treino/states/getSolicitudes.dart';
import 'package:treino/states/getSolicitudesPasadas.dart';
import 'package:treino/states/gym_coordinates.dart';
import 'package:treino/states/gymsPerCategory.dart';
import 'package:treino/states/solicitarfactura/solicitarfactura.dart';
import 'package:treino/states/login/login.dart';
import 'package:treino/states/membresias.dart';
import 'package:treino/states/recoverpassword/recoverpass.dart';
import 'package:treino/states/register/register.dart';
import 'package:treino/states/agregarSolicitudClase.dart';

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
          BlocProvider<RegisterCubit>(
            create: (BuildContext context) => RegisterCubit(),
          ),
          BlocProvider<MembresiasCubit>(
            create: (BuildContext context) => MembresiasCubit(),
          ),
          BlocProvider<CategoriesCubit>(
            create: (BuildContext context) => CategoriesCubit(),
          ),
          BlocProvider<ClassDetailCubit>(
            create: (BuildContext context) => ClassDetailCubit(),
          ),
          BlocProvider<GymDetailCubit>(
            create: (BuildContext context) => GymDetailCubit(),
          ),
          BlocProvider<SolicitudesCubit>(
            create: (BuildContext context) => SolicitudesCubit(),
          ),
          BlocProvider<SolicitarFacturaCubit>(
            create: (BuildContext context) => SolicitarFacturaCubit(),
          ),
          BlocProvider<SolicitudesPasadasCubit>(
            create: (BuildContext context) => SolicitudesPasadasCubit(),
          ),
          BlocProvider<GymsPerCategoryCubit>(
            create: (BuildContext context) => GymsPerCategoryCubit(),
          ),
          BlocProvider<ComprarMembresiasCubit>(
            create: (BuildContext context) => ComprarMembresiasCubit(),
          ),
          BlocProvider<RecuperarPasswordCubit>(
            create: (BuildContext context) => RecuperarPasswordCubit(),
          ),
          BlocProvider<RegisterCubit>(
            create: (BuildContext context) => RegisterCubit(),
          ),
          BlocProvider<AgregarSolicitudCubit>(
            create: (BuildContext context) => AgregarSolicitudCubit(),
          ),
          // BlocProvider<ExternalControllerMainTabsCubit>(
          //   create: (BuildContext context) => ExternalControllerMainTabsCubit(),
          // ),
          BlocProvider<ExternalControllerMisClasesCubit>(
            create: (BuildContext context) =>
                ExternalControllerMisClasesCubit(),
          ),
          BlocProvider<ClassesPerGymCubit>(
            create: (BuildContext context) => ClassesPerGymCubit(),
          ),
          BlocProvider<CoordinatesCubit>(
            create: (BuildContext context) => CoordinatesCubit(),
          ),
        ],
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
            FocusScopeNode currentFocus = FocusScope.of(context);

            // if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
            // }
          },
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            home: MyHomePage(title: 'Flutter Demo Home Page'),
          ),
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
