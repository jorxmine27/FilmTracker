import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../backend/api_requests/api_manager.dart';
import 'package:flutter_map/flutter_map.dart';
import 'flutter_flow_util.dart';
import 'lat_lng.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'place.dart';
import '/backend/supabase/supabase.dart';
import '../../auth/firebase_auth/auth_util.dart';

List<latLng.LatLng> listStringToLatLng(List<String> stringsLatLng) {
  List<latLng.LatLng> latLngs = [];
  for (String str in stringsLatLng) {
    List<String> parts = str.split(',');
    double lat = double.parse(parts[0]);
    double lng = double.parse(parts[1]);
    latLngs.add(latLng.LatLng(lat, lng));
  }
  return latLngs;
}

latLng.LatLng latLngParser(String? latitud, String? longitud) {

  return latLng.LatLng(double.parse(latitud!), double.parse(longitud!));
}

String cargarUbicaciones(ApiCallResponse Response) {
  String response = getJsonField(Response.jsonBody, r'''$..LatLng''');
  return response;
}

latLng.LatLng center(ApiCallResponse Response) {
  String coordenadas = cargarUbicaciones(Response);
  List<String> latlng = coordenadas.split(',');
  latLng.LatLng ubicacion = latLngParser(latlng[0].toString(), latlng[1].toString());
  return ubicacion;
}

Marker marcadores(ApiCallResponse Response) {
  String coordenadas = cargarUbicaciones(Response);
  List<String> latlng = coordenadas.split(',');
  latLng.LatLng ubicacion = latLngParser(latlng[0].toString(), latlng[1].toString());
  Marker Marcador = Marker(
      point: ubicacion,
      width: 128,
      height: 128,
      builder: (context) => Image(
        image: AssetImage('assets/images/actual_marker_filmtracker.png'),
      )
  );
  return Marcador;
}

bool searchEngine(
  String searchInput,
  String searchFor,
) {
  return searchInput.toLowerCase().contains(searchFor.toLowerCase());
}
