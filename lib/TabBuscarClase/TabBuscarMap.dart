import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:treino/states/gym_coordinates.dart';
import 'lite_mode.dart';
import 'animate_camera.dart';
import 'map_click.dart';
import 'map_coordinates.dart';
import 'map_ui.dart';
import 'marker_icons.dart';
import 'move_camera.dart';
import 'padding.dart';
import 'page.dart';
import 'place_circle.dart';
import 'place_marker.dart';
import 'place_polygon.dart';
import 'place_polyline.dart';
import 'scrolling_map.dart';
import 'snapshot.dart';

final List<GoogleMapExampleAppPage> _allPages = <GoogleMapExampleAppPage>[
  MapUiPage(),
  MapCoordinatesPage(),
  MapClickPage(),
  // AnimateCameraPage(),
  // MoveCameraPage(),
  PlaceMarkerPage(),
  MarkerIconsPage(),
  // ScrollingMapPage(),
  // PlacePolylinePage(),
  PlacePolygonPage(),
  // PlaceCirclePage(),
  // PaddingPage(),
  // SnapshotPage(),
  // LiteModePage(),
];

class MapsDemo extends StatelessWidget {
  void _pushPage(BuildContext context, GoogleMapExampleAppPage page) {
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (_) => Scaffold(
              appBar: AppBar(title: Text(page.title)),
              body: page,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GoogleMaps examples')),
      body: ListView.builder(
        itemCount: _allPages.length,
        itemBuilder: (_, int index) => ListTile(
          leading: _allPages[index].leading,
          title: Text(_allPages[index].title),
          onTap: () => _pushPage(context, _allPages[index]),
        ),
      ),
    );
  }
}

class TabBuscarMap extends StatefulWidget {
  @override
  _TabBuscarMapState createState() => _TabBuscarMapState();
}

class _TabBuscarMapState extends State<TabBuscarMap> {
  var gradesRange = RangeValues(0, 5);

  Widget mapi(BuildContext context) {
    return BlocBuilder<CoordinatesCubit, List<String>>(
      builder: (context, latLon) => latLon != null
          ?
          // Container(height: 400,width: 400,child: MarkerIconsPage())
          // MarkerIconsPage()
          MapCoordinatesPage(
              lat: latLon[0],
              lon: latLon[1],
            )
          : Container(),
    );
  }

  // Widget mapi() {
  //   return new FlutterMap(
  //     options: new MapOptions(
  //       center: new LatLng(51.5, -0.09),
  //       zoom: 13.0,
  //     ),
  //     layers: [
  //       new TileLayerOptions(
  //         urlTemplate: "https://api.tiles.mapbox.com/v4/"
  //             "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
  //         additionalOptions: {
  //           'accessToken': 'pk.eyJ1IjoiaW5jYWZveCIsImEiOiJja2JjdjZxdGgwNXB6MnZtdXoxZG5zN2Y4In0.avjfgo89OI5TL9_EMZjFIg',
  //           'id': 'mapbox.streets',
  //         },
  //       ),
  //       new MarkerLayerOptions(
  //         markers: [
  //           new Marker(
  //             width: 80.0,
  //             height: 80.0,
  //             point: new LatLng(51.5, -0.09),
  //             builder: (ctx) => new Container(
  //               child: new FlutterLogo(),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: GradientAppBar("buscando"),
          ),
          Container(child: mapi(context))
        ],
      ),
    );
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // MaterialButton(
          //   onPressed: () {
          //     Navigator.pop(
          //       context,
          //     );
          //   },
          //   child: IconButton(
          //       icon: Icon(
          //         Icons.arrow_back_ios,
          //         size: 38,
          //         color: Colors.white,
          //       ),
          //       onPressed: null),
          // ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                minWidth: 6,
                onPressed: () {
                  print("as");
                  // Navigator.push(
                  // context,
                  // MaterialPageRoute(builder: (context) => TabBuscarClase()),
                  // MaterialPageRoute(builder: (context) => Membresias()),
                  // );
                },
                child: Center(
                  child: Text(
                    "Gimnasios Cerca",
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(18.0),
          //   child: MaterialButton(
          //     minWidth: 6,
          //     onPressed: () {
          //       print("as");
          //       // Navigator.push(
          //       //   context,
          //       //   MaterialPageRoute(builder: (context) => TabBuscarClase()),
          //       // MaterialPageRoute(builder: (context) => Membresias()),
          //       // );
          //     },
          //     child: Center(
          //         // child: Text(
          //         //   "Aplicar",
          //         //   style: TextStyle(
          //         //       fontSize: 25.0,
          //         //       color: Colors.white,
          //         //       fontWeight: FontWeight.bold),
          //         // ),
          //         ),
          //   ),
          // ),
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

// final List<GoogleMapExampleAppPage> _allPages = <GoogleMapExampleAppPage>[
//   MapUiPage(),
//   MapCoordinatesPage(),
//   MapClickPage(),
//   AnimateCameraPage(),
//   MoveCameraPage(),
//   PlaceMarkerPage(),
//   MarkerIconsPage(),
//   ScrollingMapPage(),
//   PlacePolylinePage(),
//   PlacePolygonPage(),
//   PlaceCirclePage(),
//   PaddingPage(),
//   SnapshotPage(),
//   LiteModePage(),
// ];

// class MapsDemo extends StatelessWidget {
//   void _pushPage(BuildContext context, GoogleMapExampleAppPage page) {
//     Navigator.of(context).push(MaterialPageRoute<void>(
//         builder: (_) => Scaffold(
//               appBar: AppBar(title: Text(page.title)),
//               body: page,
//             )));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('GoogleMaps examples')),
//       body: ListView.builder(
//         itemCount: _allPages.length,
//         itemBuilder: (_, int index) => ListTile(
//           leading: _allPages[index].leading,
//           title: Text(_allPages[index].title),
//           onTap: () => _pushPage(context, _allPages[index]),
//         ),
//       ),
//     );
//   }
// }
