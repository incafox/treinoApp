import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:treino/TabInicio/TabInicio.dart';
import 'package:treino/TabBuscarClase/TabBuscarClase.dart';
import 'package:treino/TabBuscarClase/TabBuscarClasePrimer.dart';
import 'package:treino/TabMisClases/TabMisClases.dart';
import 'package:treino/TabPerfil/TabPerfil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treino/states/categories.dart';
import 'package:treino/states/externalcontroltab/externalControlTab.dart';
import 'package:treino/states/register/register.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu>
    with SingleTickerProviderStateMixin {
  // GlobalKey<_MainMenuState> _mainMenuState;
  GlobalKey<_MainMenuState> _key = GlobalKey();

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 4, vsync: this);
    setState(() {});
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    return (Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainMenu()),
        )) ??
        false;
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            content: Container(
              // color: Colors.brown,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Center(
                        child: new GestureDetector(
                          onTap: () => Navigator.of(context).pop(false),
                          child: Text("No"),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 16),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Center(
                        child: new GestureDetector(
                          onTap: () => SystemNavigator.pop(),
                          child: Text("Si"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            title: new Text('Seguro que deseas salir?'),
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    context.bloc<CategoriesCubit>().getAllCategorias();

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: DefaultTabController(
          length: 4,
          child: Scaffold(
            body: TabBarView(
              controller: tabController,
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    // physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      // Expanded(child: TabInicio()),
                      GradientAppBar("Treino"),
                      Container(
                          color: Colors.white,
                          // width: 100,
                          child: TabInicio(this.tabController)),
                      // TabInicio(),
                    ],
                  ),
                ),
                // TabBuscarClase(),
                TabBuscarClasePrimer(),
                TabMisClases(),
                TabPerfil(),
              ],
            ),
            backgroundColor: Color(0xef0781e5),
            bottomNavigationBar: Container(
              height: 80,
              child: Center(
                child: TabBar(
                  // indicator: TextDecoration.overline ,
                  controller: tabController,
                  onTap: (index) {
                    tabController.animateTo(index);
                    // context
                    //     .bloc<ExternalControllerMainTabsCubit>()
                    //     .tabber
                    //     .animateTo(index);
                  },
                  // indicatorWeight: 1,
                  tabs: [
                    Container(
                      // height: 60,
                      child: Tab(
                        text: "Inicio",
                        icon: Container(
                          // height: 100,
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.home),
                              // Text("Inicio", style: TextStyle(fontSize: 10))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      text: "Buscar",
                      icon: Container(
                        // height: 100,
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.search),
                            // Text(
                            //   "Buscar Clase",
                            //   style: TextStyle(fontSize: 10),
                            // )
                          ],
                        ),
                      ),
                    ),
                    Tab(
                      text: "Mis Clases",
                      icon: Container(
                        // height: 100,
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.fitness_center),
                            // Text("Mis Clases", style: TextStyle(fontSize: 10))
                          ],
                        ),
                      ),
                    ),
                    Tab(
                      text: "Perfil",
                      icon: Container(
                        // height: 100,
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.person),
                            // Text("Perfil", style: TextStyle(fontSize: 10))
                          ],
                        ),
                      ),
                    )
                  ],
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: EdgeInsets.all(0.0),
                  labelStyle: TextStyle(fontSize: 12),
                  indicatorColor: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 111.0;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return new Container(
      padding: EdgeInsets.only(top: statusbarHeight),
      height: statusbarHeight + barHeight,
      child: Center(
        child: Center(
          child: Opacity(
            opacity: 1,
            child: Image(
                color: Colors.white,
                colorBlendMode: BlendMode.srcIn,
                fit: BoxFit.fitWidth,
                height: 60,
                width: 180,
                image: AssetImage('assets/images/Group 2@3x.png')),
          ),
        ),
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
