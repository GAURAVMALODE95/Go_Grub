import 'dart:async';
import 'package:flutter/material.dart';

class TimerProvider with ChangeNotifier {
  late Timer _timer;
  int _seconds = 18;

  TimerProvider() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        _seconds--;
        notifyListeners();
      } else {
        _timer.cancel();
      }
    });
  }

  int get seconds => _seconds;
void resetTimer() {
  _seconds = 18;
  _timer.cancel(); // Cancel the existing timer
  _timer = Timer.periodic(Duration(seconds: 1), (timer) {
    if (_seconds > 0) {
      _seconds--;
      notifyListeners();
    } else {
      _timer.cancel();
    }
  });
  notifyListeners();
}

}
