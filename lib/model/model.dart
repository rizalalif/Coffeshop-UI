import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class CoffeeList {
  final String id;
  final String name;
  final String imageCoffee;
  final String price;
  final String rating;
  final String topping;
  final String desc;
  final String kat;
  final String isFavorited;
  

  CoffeeList({
    required this.id,
    required this.name,
    required this.imageCoffee,
    required this.price,
    required this.rating,
    required this.topping,
    required this.desc,
    required this.kat,
  });

  factory CoffeeList.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return CoffeeList(
      id: doc.id,
      name: data['name'] ?? '',
      imageCoffee: data['img'] ?? '',
      price: data['price'] ?? '',
      rating: data['rating'] ?? '',
      topping: data['topping'] ?? '',
      desc: data['desc'] ?? '',
      kat: data['kat'] ?? '',
      kat: data['isFavorited'] ?? '',
    );
  }
}

 
