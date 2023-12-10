// import 'dart:js';
// import 'package:coffeshop/botnav.dart';
// import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeshop/controllers/coffee_provider.dart';
import 'package:coffeshop/service/data_service.dart';
import 'package:coffeshop/widgets/botnav.dart';
import 'package:coffeshop/widgets/categories.dart';
import 'package:coffeshop/controllers/main_provider.dart';
import 'package:coffeshop/widgets/detail_coffee.dart';
import 'package:coffeshop/login_page.dart';
// import 'package:coffeshop/profil.dart';
import 'package:coffeshop/landing_page.dart';
import 'package:coffeshop/profil_page.dart';
import 'package:coffeshop/screen/cart_page.dart';
import 'package:coffeshop/screen/favourite_page.dart';
import 'package:coffeshop/special_offer.dart';
import 'package:coffeshop/screen/bottom.dart';
import 'package:coffeshop/widgets/searc_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart'; // For Iconify Widget
import 'package:iconify_flutter/icons/fontisto.dart';
import 'package:iconify_flutter/icons/zondicons.dart'; // for Non Colorful Icons
import 'package:colorful_iconify_flutter/icons/emojione.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

import '../model/model.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    // var coffeProvider = Provider.of<CoffeeListProvider>(context);
    return Scaffold(
      
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Profil(),
            Cari(),
            SpecialOffer(),
            // ElevatedButton(onPressed: () {
            //   print(coffeProvider.fetchCoffeeData());
            // }, child: Text('tes')),

            Kategori(),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigation()
    );

    // },);
  }
}

