import 'package:flutter/material.dart';

class Car with ChangeNotifier {
  late int _carPrice;
  bool _isInitialized = false;
  bool _toBeEntered = true;

  int get carPrice => _carPrice;

  bool get isInitialized => _isInitialized;

  bool get toBeEntered => _toBeEntered;

  set carPrice(int value) {
    _carPrice = value;
    _isInitialized = true;
    _toBeEntered = false;
    notifyListeners();
  }
}
