// import 'dart:js';
// import 'package:coffeshop/botnav.dart';
// import 'dart:typed_data';

import 'package:coffeshop/screen/home_page.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart'; // For Iconify Widget
import 'package:iconify_flutter/icons/fontisto.dart';
import 'package:iconify_flutter/icons/zondicons.dart'; // for Non Colorful Icons
import 'package:colorful_iconify_flutter/icons/emojione.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

import 'model/model.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  // var _bottomNavIndex = 0;
   List<Widget> pageList = [
      HomePage(),
      Favourite(),
      MyProfil(),
    ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(builder: (context, mainScreenNotifier, child) {
     return Scaffold(
        resizeToAvoidBottomInset: false,
        // backgroundColor: Colors.white,
        body: pageList[mainScreenNotifier.pageIndex],
       extendBody: true,
        bottomNavigationBar: BottomNavigation());
      
    },);
  }
}






