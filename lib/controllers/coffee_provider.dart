import 'package:coffeshop/model/model.dart';
import 'package:coffeshop/service/data_service.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Import model yang telah dibuat sebelumnya
import 'package:coffeshop/model/model.dart';

class CoffeeListProvider extends ChangeNotifier {
  List<CoffeeList> _coffeeList = [];
  final CoffeeService _coffeeService = CoffeeService();

  
//   List<CoffeeListProvider> _coffeeList = [];

  // Fungsi untuk mendapatkan daftar kopi dari Firestore
  Future<void> fetchCoffeeList() async {
    try {
     Stream<List<CoffeeList>> getCoffeeListStream() {
    return _coffeeService.getCoffees("based espresso").map(
      (QuerySnapshot querySnapshot) {
        _coffeeList = querySnapshot.docs.map((doc) {
          return CoffeeList.fromFirestore(doc);
        }).toList();
        notifyListeners(); // Memberi tahu listener bahwa data telah berubah
        return _coffeeList;
      },
    );
  }

      notifyListeners();
    } catch (e) {
      print('Error fetching coffee list: $e');
    }
  }

  // Fungsi untuk mendapatkan daftar kopi
  List<CoffeeList> getCoffeeList() {
    return _coffeeList;
  }
}


// class CoffeeListProvider extends ChangeNotifier {
//   final CoffeeService _coffeeService = CoffeeService();
//   List<CoffeeListProvider> _coffeeList = [];

//   Stream<List<CoffeeList>> getCoffeeListStream() {
//     return _coffeeService.getCoffees().map(
//       (QuerySnapshot querySnapshot) {
//         _coffeeList = querySnapshot.docs.map((doc) {
//           return CoffeeList.fromFirestore(doc);
//         }).toList();
//         notifyListeners(); // Memberi tahu listener bahwa data telah berubah
//         return _coffeeList;
//       },
//     );
//   }
// }

