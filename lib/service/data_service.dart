import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeshop/model/model.dart';

class CoffeeService {
  final CollectionReference coffees =
      FirebaseFirestore.instance.collection('coffee');

  Stream<QuerySnapshot> getCoffees(kategori) {
    final coffeeStream = coffees.where("kat", isEqualTo: kategori).snapshots();

    return coffeeStream;
  }

  Stream<QuerySnapshot> getFav(bool favorited) {
    final favStream =
        coffees.where("isFavorited", isEqualTo: favorited).snapshots();

    return favStream;
  }

  void updateFirestoreValue(String itemID, bool isFavorited) {
    coffees.doc(itemID)
        .update({
      'isFavorited': isFavorited,
    });
  }

// Future<void> toggleFavoriteStatus(data) async {
//     QuerySnapshot query = await coffees.get();

//     query.docs.forEach((data) {
//       print(data.data());
//     });
//   }
  // Future<void> toggleFavoriteStatus(String coffeeId, bool currentStatus) async {
  //   await coffees.doc(coffeeId).update({
  //     'isFavorited': !currentStatus,
  //   });
  // }

  // Stream<QuerySnapshot> getCoffeesWithFavoriteStatus(bool isFavorited) {
  //   final coffeeStream = coffees.where('isFavorited', isEqualTo: isFavorited).snapshots();
  //   return coffeeStream;
  // }
}
