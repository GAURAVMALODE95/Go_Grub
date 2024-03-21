import 'package:flutter/material.dart';



class TextFieldProvider with ChangeNotifier{

  String _entvalue = '';

  String get entvalue => _entvalue;

  set entvalue(String value){
    _entvalue = value;
    notifyListeners();
  }
}