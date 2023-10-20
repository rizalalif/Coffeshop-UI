// import 'dart:js';
// import 'package:coffeshop/botnav.dart';
// import 'dart:typed_data';

import 'package:coffeshop/categories.dart';
import 'package:coffeshop/detail_coffee.dart';
import 'package:coffeshop/login_page.dart';
// import 'package:coffeshop/profil.dart';
import 'package:coffeshop/landing_page.dart';
import 'package:coffeshop/special_offer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart'; // For Iconify Widget
import 'package:iconify_flutter/icons/fontisto.dart';
import 'package:iconify_flutter/icons/zondicons.dart'; // for Non Colorful Icons
import 'package:colorful_iconify_flutter/icons/emojione.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import 'model/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _bottomNavIndex = 0;
  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.add_shopping_cart,
    Icons.account_circle,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _appBar(),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Profil(),
            Cari(),
            SpecialOffer(),
            Kategori(),
          ],
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        gapLocation: GapLocation.none,
        icons: iconList,
        activeIndex: _bottomNavIndex,
        // leftCornerRadius: 32,
        // rightCornerRadius: 32,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        //other params
      ),
    );
  }
}





class Cari extends StatelessWidget {
  const Cari({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      padding: EdgeInsets.only(top: 30, bottom: 20, left: 30, right: 30),
      child: SearchBar(
        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 20)),
        hintText: 'Search',
        backgroundColor:
            MaterialStatePropertyAll(const Color.fromARGB(255, 248, 247, 250)),
        side: MaterialStatePropertyAll(BorderSide(color: Colors.black)),
        textStyle: MaterialStatePropertyAll(TextStyle()),
        leading: Icon(
          Icons.search,
          size: 30,
          color: const Color.fromARGB(255, 166, 166, 170),
        ),
        elevation: MaterialStatePropertyAll(0),
        trailing: [
          Icon(
            Icons.menu,
            color: Color.fromARGB(255, 132, 96, 70),
          ),
          // SizedBox(width: 303,)
        ],
      ),
    );
  }
}



// _appBar() {
//   return AppBar(
//     toolbarHeight: 110,
//     backgroundColor: Colors.transparent,
//     elevation: 0,
//     automaticallyImplyLeading: false,

//   );
// // Title(color: Colors.black, child: Text('tes'));
// }
