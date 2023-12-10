import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class CoffeeList {
  // final String id;
  final String name;
  final String imageCoffee;
  final String price;
  // final String rating;
  // final String topping;
  // final String desc;
  final String kat;

  CoffeeList({
    // required this.id,
    required this.name,
    required this.imageCoffee,
    required this.price,
    // required this.rating,
    // required this.topping,
    // required this.desc,
    required this.kat,
  });

  factory CoffeeList.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return CoffeeList(
      // id: doc.id,
      name: data['name'] ?? '',
      imageCoffee: data['img'] ?? '',
      price: data['price'] ?? '',
      // rating: data['rating'] ?? '',
      // topping: data['topping'] ?? '',
      // desc: data['desc'] ?? '',
      kat: data['kat'] ?? '',
    );
  }
}

  // Map<String,dynamic> _data = {};
  // Map<String,dynamic> get data => _data;
  // int get jumlahData => _data.length;

  // Future <void> connectAPI() async {
  //   Uri url = Uri.parse("https://api-coffeshop-default-rtdb.firebaseio.com/coffeshop.json");
  //   var resultResponse = await http.get(url);

  //   _data = jsonDecode(resultResponse.body);
  //   if (data != null) {
  //   print(data);
  //   } else {
  //     print("Data is null or does not contain a 'name' key.");
  //   }
  // }


// CoffeeList(
//   this.name,
//   this.image_coffee,
//   this.price,
//   this.rating,
//   this.topping,
//   this.desc,
//   this.kat,
// );
