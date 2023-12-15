import 'package:flutter/material.dart';

class ViewToggle with ChangeNotifier {
  int _selectedView = 1;

  int get selectedView => _selectedView;

  void setSelectedView(int index) {
    _selectedView = index;
    notifyListeners();
  }
}
