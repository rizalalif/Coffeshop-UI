import 'package:flutter/material.dart';

class FavProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _favourites = [];

  List<Map<String, dynamic>> get favourite => _favourites;

  void addFavourite(Map<String, dynamic> coffee) {
    _favourites.add(coffee);
    notifyListeners();
  }

  bool isFav(Map<String, dynamic> coffee) {
    return _favourites.contains(coffee);
  }

  void removeFromFavorites(Map<String, dynamic> coffee) {
    _favourites.remove(coffee);
    notifyListeners();
  }
}
