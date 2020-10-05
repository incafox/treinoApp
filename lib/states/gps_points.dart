import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class PointsCubit extends Cubit<List<Marker>> {
  PointsCubit() : super(null);
  // UserInfo info = new UserInfo();
  BitmapDescriptor _markerIcon;
  List<Marker> markers;

  // Set<Marker> _createMarker() {
  //   // TODO(iskakaushik): Remove this when collection literals makes it to stable.
  //   // https://github.com/flutter/flutter/issues/28312
  //   // ignore: prefer_collection_literals
  //   return <Marker>[
  //     Marker(
  //       onTap: () {
  //         print("la tuya ");
  //       },
  //       markerId: MarkerId("marker_1"),
  //       position: LatLng(double.parse(widget.lat), double.parse(widget.lon)),
  //       icon: _markerIcon,
  //     ),
  //   ].toSet();
  // }

  void setCoordinates(String ciudad) async {
    final response = await http.post(
        'https://treino.club/demo/api/AppMovil/getGymsByFiltros',
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"idCiudad": ciudad}));
    print("filtrados");
    print("id de ciudad >> " + ciudad);
    print(jsonDecode(response.body)['items']);
    // emit(jsonDecode(response.body));
    List<dynamic> res = jsonDecode(response.body)['items'];
    List<LatLng> puntos;
    res.forEach((element) {
      LatLng tem = LatLng(
          double.parse(element['latitud']), double.parse(element['longitud']));
      puntos.add(tem);
      print(element['latitud'] + " -- " + element['longitud']);
    });

    if (this.markers.length > 0) {
      this.markers.clear();
    }
    int i = 0;
    puntos.forEach((element) {
      i++;
      this.markers.add(
            Marker(
              onTap: () {
                print("la tuya ");
              },
              markerId: MarkerId(i.toString()),
              position: LatLng(element.latitude, element.longitude),
              icon: _markerIcon,
            ),
          );
    });
    emit(this.markers);
  }
}
