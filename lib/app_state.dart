import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _takenPhoto64bits = '';
  String get takenPhoto64bits => _takenPhoto64bits;
  set takenPhoto64bits(String value) {
    _takenPhoto64bits = value;
  }
}
