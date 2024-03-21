import 'package:flutter/material.dart';

class HeartProvider with ChangeNotifier {
  Map<String, bool> _heartStates = {};

  bool isRed(String title) {
    return _heartStates[title] ?? false;
  }

  void toggleHeart(String title) {
    if (_heartStates.containsKey(title)) {
      _heartStates[title] = !_heartStates[title]!;
    } else {
      _heartStates[title] = true;
    }
    notifyListeners();
  }

  List<String> getWishlistItems() {
    return _heartStates.entries.where((entry) => entry.value).map((e) => e.key).toList();
  }
}
