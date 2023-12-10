import 'package:coffeshop/main_screen.dart';
import 'package:coffeshop/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:splash/login_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainScreen(),
            ));
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
        ),
        Bunderan(
          top: -193,
          right: -60,
          // left: -60,
          // bottom: ,
          radius: 366,
          color: Colors.brown[400],
        ),
        Bunderan(
          top: -73,
          left: -32,
          // left: -60,
          // bottom: ,
          radius: 173,
          color: Colors.brown[900],
        ),
        Bunderan(
          // top: -73,
          left: -85,
          // left: -60,
          bottom: -273,
          radius: 466,
          color: Colors.brown[400],
        ),
        Bunderan(
          // top: -73,
          right: -12,
          // left: -60,
          bottom: 27,
          radius: 135,
          color: Colors.brown[800],
        ),
        Center(child: Text('Waiting...',style: GoogleFonts.robotoMono(color: Colors.brown,fontSize: 30 ),))
      ],
    ));
  }
}

class Bunderan extends StatelessWidget {
  double? top, bottom, left, right, radius;
  Color? color;
  Bunderan(
      {super.key,
      this.top,
      this.bottom,
      this.left,
      this.right,
      this.color,
      required this.radius});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      left: left,
      bottom: bottom,
      child: Container(
        height: radius,
        width: radius,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          // borderRadius: BorderRadius.circular(radius);
        ),
      ),
    );
  }
}
