import 'package:coffeshop/profil_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class BotNav extends StatefulWidget {
  const BotNav({super.key});

  @override
  State<BotNav> createState() => _BotNavState();
}

class _BotNavState extends State<BotNav> {
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
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeColor: Colors.brown,
        activeIndex: _bottomNavIndex,
        leftCornerRadius: 32,
        rightCornerRadius: 0,
        onTap: (index) => setState(() {
          print("sds");
          _bottomNavIndex = index;
          if (index == 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyProfil(),
                ));
          }
        }),
      ),
    );
  }
}
