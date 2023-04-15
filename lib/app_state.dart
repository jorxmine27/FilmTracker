import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _email = prefs.getString('ff_email') ?? _email;
    _token = prefs.getString('ff_token') ?? _token;
    _id = prefs.getString('ff_id') ?? _id;
    _idPeli = prefs.getInt('ff_idPeli') ?? _idPeli;
    _idCine = prefs.getInt('ff_idCine') ?? _idCine;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _toggle = false;
  bool get toggle => _toggle;
  set toggle(bool _value) {
    _toggle = _value;
  }

  String _email = '';
  String get email => _email;
  set email(String _value) {
    _email = _value;
    prefs.setString('ff_email', _value);
  }

  String _token = '';
  String get token => _token;
  set token(String _value) {
    _token = _value;
    prefs.setString('ff_token', _value);
  }

  String _id = '';
  String get id => _id;
  set id(String _value) {
    _id = _value;
    prefs.setString('ff_id', _value);
  }

  int _idPeli = 0;
  int get idPeli => _idPeli;
  set idPeli(int _value) {
    _idPeli = _value;
    prefs.setInt('ff_idPeli', _value);
  }

  int _idCine = 0;
  int get idCine => _idCine;
  set idCine(int _value) {
    _idCine = _value;
    prefs.setInt('ff_idCine', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
