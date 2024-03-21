import 'package:flutter/material.dart';
import 'dart:async';

class SearchModel with ChangeNotifier {
  int _index = 0;
  List<String> _texts = ['Try Biryani', 'Try Dosa', 'Try Noodles'];
  String get text => _texts[_index];

  late Timer _timer;

  SearchModel() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      _index = (_index + 1) % _texts.length;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
