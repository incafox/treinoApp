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
import 'package:treino/states/externalControlTab.dart';
import 'package:treino/states/register.dart';

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
          // MaterialPageRoute(builder: (context) => Membresias()),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    context.bloc<CategoriesCubit>().getAllCategorias();

    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        // initialIndex: 1,
        length: 4,
        child: Scaffold(
          // appBar: PreferredSize(
          //     preferredSize: Size.fromHeight(100.0),
          //     child: AppBar(
          //       title: Container(child: Text("data")),
          //       flexibleSpace: Container(
          //         height: 0,
          //         child: Text(" dasqd"),
          //       ),
          //     )),
          body: TabBarView(
            controller: tabController,
            children: [
              ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  // Expanded(child: TabInicio()),
                  GradientAppBar("Treino"),
                  Container(width: 100, child: TabInicio(this.tabController)),
                  // TabInicio(),
                ],
              ),
              // TabBuscarClase(),
              TabBuscarClasePrimer(),
              TabMisClases(),
              TabPerfil(),
            ],
          ),
          backgroundColor: Color(0xef0781e5),
          bottomNavigationBar: PreferredSize(
            preferredSize: Size(200.0, 70.0),
            child: Container(
              height: 40,
              child: Center(
                child: TabBar(
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
                    Tab(
                      icon: Container(
                        height: 100,
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.home),
                            Text("Inicio", style: TextStyle(fontSize: 10))
                          ],
                        ),
                      ),
                    ),
                    Tab(
                      icon: Container(
                        height: 100,
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.search),
                            Text(
                              "Buscar Clase",
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                      ),
                    ),
                    Tab(
                      icon: Container(
                        height: 100,
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.fitness_center),
                            Text("Mis Clases", style: TextStyle(fontSize: 10))
                          ],
                        ),
                      ),
                    ),
                    Tab(
                      icon: Container(
                        height: 100,
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.person),
                            Text("Perfil", style: TextStyle(fontSize: 10))
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
