import 'package:coffeshop/profil_page.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key, this.onTap, required this.ikon,
  });
  final void Function()? onTap;
  final IconData ikon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // color: Colors.amber,
        height: 32,
        width: 36,
        child: Icon(ikon,color: Colors.white,size: 24,),
      ),
    );
  }
}