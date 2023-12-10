import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProfil extends StatelessWidget {
  const MyProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('My Profile',style: GoogleFonts.montserrat(color: Colors.white,fontSize: 20 ),),
        backgroundColor: Colors.brown,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 30),
      ),
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 270,
              width: 270,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(150)),
              child: Image.asset(
                'assets/images/me.JPG',
                fit: BoxFit.fitWidth,
              )),
          Column(
            children: [
              FormPengguna(ikon: Icon(Icons.person),isi: 'Rizal Alif Nanda Muriadi'),
              FormPengguna(ikon: Icon(Icons.badge),isi: '2106051101007'),
              FormPengguna(ikon: Icon(Icons.location_on),isi: 'Bendungan Sutami, Malang '),
            ],
          )
        ],
      ),
    ));
  }
}

class FormPengguna extends StatelessWidget {
  final Icon ikon;
  final String isi;
  const FormPengguna({
    super.key, required this.ikon, required this.isi,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: TextField(
        enabled: false,
        // controller: TextEditingController(text: 'Rizal Alif Nanda Muriadi'),
        
        decoration: InputDecoration(
          hintText:isi ,
          hintStyle: TextStyle(fontSize: 18),
          // text
          // hintStyle: TextStyle(),
          contentPadding:EdgeInsets.only(top: 14,left: 20) ,
          // hintStyle: GoogleFonts.lato(),
          // hintTextDirection: TextDirection.ltr,
          prefixIcon: ikon,
          
          ),
      ),
    );
  }
}
