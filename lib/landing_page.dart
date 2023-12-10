import 'package:coffeshop/profil_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'nyar/login_user.dart';

class Profil extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Profil({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyProfil(),
                      ));
                },
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/images/me.png'),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Color.fromARGB(213, 255, 193, 7),
                  ),
                  Text(
                    'Sumbersari, Malang',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w900),
                  )
                ],
              ),
              InkWell(
                radius: 50,
                borderRadius: BorderRadius.circular(50),
                overlayColor: MaterialStatePropertyAll(Colors.grey[200]),
                onTap: () {
                  _auth.signOut();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ));
                },
                child: Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.black,
                  size: 30,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 31.0),
          child: Text(
            'Good morning, Rizal',
            style: GoogleFonts.lato(
                fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        )
      ],
    );
  }
}
