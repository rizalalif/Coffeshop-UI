import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecialOffer extends StatelessWidget {
  const SpecialOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 31, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Special Offer',
                    style: GoogleFonts.lato(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Image.asset(
                    'assets/images/api.png',
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 161,
          // color: Colors.deepOrange,
          child: ListView(scrollDirection: Axis.horizontal, children: [
            OfferContent(
                img: 'assets/images/offer.jpg',
                capt: 'Buy 1 get 1 if you buy with Gopay'),
            OfferContent(
                img: 'assets/images/kopi2.jpg',
                capt: 'Discount all variant until 8 am'),
          ]),
        ),
      ],
    );
  }
}

class OfferContent extends StatelessWidget {
  final String img;
  final String capt;
  const OfferContent({
    super.key,
    required this.img,
    required this.capt,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 10, top: 15, bottom: 10),
      child: Container(
        height: 140,
        width: 330,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2), // Warna bayangan
                spreadRadius: 5, // Seberapa jauh bayangan menyebar dari objek
                blurRadius: 7, // Seberapa buram bayangan
                offset: Offset(0, 3), // Posisi bayangan (X,Y)
              ),
            ]),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              // color: Colors.amber,
              height: 117,
              width: 153,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    img,
                    fit: BoxFit.fill,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 20,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.brown,
                  ),
                  child: Text(
                    'Limited',
                    style: GoogleFonts.lato(fontSize: 8, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 110,
                  height: 80,
                  // color: Colors.blue,
                  child: Text(
                    capt,
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}