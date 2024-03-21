import 'package:flutter/material.dart';
class AddButtonProvider with ChangeNotifier {
  bool _added = false;

  bool get added => _added;

  void toggleState() {
    _added = !_added;
    notifyListeners();
  }
}