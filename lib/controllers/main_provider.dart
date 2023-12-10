import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreenNotifier extends ChangeNotifier {
  int _pageIndex = 0;
  bool _isFloating = false;

  int get pageIndex => _pageIndex;

  set pageIndex(newIndex){
    _pageIndex = newIndex;
    notifyListeners();
  }

  set isFloating(bool value){
    _isFloating = value;
    notifyListeners();

  }


  
}