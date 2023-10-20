import 'package:coffeshop/model/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailContent extends StatelessWidget {
  final CoffeeList coffee;
  const DetailContent({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            '${coffee.image_coffee}',
            // width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 750, right: 320),
            child: ElevatedButton(
                style: ButtonStyle(
                    // alignment: Alignment.center,
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    shape: MaterialStatePropertyAll(CircleBorder()),
                    // padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
                    fixedSize: MaterialStatePropertyAll(Size(40, 40))),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // margin: EdgeInsets.all(0),
                    // color: Colors.amber,
                    children: [
                      Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                      ),
                    ])),
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            height: 520,
            width: double.infinity,
            // alignment: Alignment.,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text('tes',style: TextStyle(fontSize: 20,color: Colors.amber),),
                // Text("data"),
                Container(
                  height: 60,
                  // color: Colors.amber,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${coffee.name}',
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.white),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        '${coffee.topping}',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10, left: 5),
                  alignment: Alignment.center,
                  height: 35,
                  width: 63,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.brown),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 17,
                      ),
                      Text(
                        '${coffee.rating}',
                        style: GoogleFonts.lato(
                            color: Colors.white, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                )
              ],
            ),
            // child: ,
            // child: Text('tes'),
          ),
          Container(
            height: 450,
            width: double.infinity,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )),
            child: Container(
              height: 450,
              width: 340,
              // color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CoffeeContaine(toping: '${coffee.topping}'),
                  Container(
                      margin: EdgeInsets.only(top: 25, bottom: 15),
                      // color: Colors.amber,
                      child: Text(
                        'Coffee Size',
                        style: GoogleFonts.lato(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CoffeeSize(
                        sizeGlass: 'Small',
                      ),
                      CoffeeSize(
                        sizeGlass: 'Medium',
                      ),
                      CoffeeSize(
                        sizeGlass: 'Large',
                      ),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 25, bottom: 15),
                      // color: Colors.amber,
                      child: Text(
                        'About',
                        style: GoogleFonts.lato(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  DescCoffee(
                    desc: '${coffee.desc}',
                  ),
                  ButtonCart(
                    harga: '${coffee.price}',
                  )
                ],
              ),
            ),
            // child: Text('tes'),
          )
        ],
      ),
    );
  }
}

class CoffeeContaine extends StatelessWidget {
  final String toping;
  const CoffeeContaine({super.key, required this.toping});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        margin: EdgeInsets.only(top: 25),
        height: 60,
        width: 340,
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(40)),
        child: Row(
          children: [
            Container(
                // margin:
                padding: EdgeInsets.symmetric(horizontal: 20),
                // color: Colors.amber,
                alignment: Alignment.center,
                height: 60,
                width: 106,
                // decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.black))),
                child: Row(
                  children: [
                    Icon(Icons.coffee_maker),
                    Text(
                      'Coffee',
                      style: GoogleFonts.lato(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            Container(
                // margin:
                padding: EdgeInsets.symmetric(horizontal: 10),
                // color: Colors.amber,
                alignment: Alignment.center,
                height: 60,
                width: 104,
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.black, width: 1),
                        left: BorderSide(color: Colors.black, width: 1))),
                child: Row(
                  children: [
                    Icon(Icons.coffee_maker),
                    Text(
                      toping,
                      style: GoogleFonts.lato(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            Container(
                // margin:
                padding: EdgeInsets.symmetric(horizontal: 10),
                // color: Colors.amber,
                alignment: Alignment.center,
                height: 60,
                width: 112,
                // decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.black),left: BorderSide(color: Colors.black))),
                child: Row(
                  children: [
                    // Icon(Icons.coffee_maker),
                    Text(
                      'Medium Roasted',
                      style: GoogleFonts.lato(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
          ],
        ));
  }
}

class CoffeeSize extends StatefulWidget {
  final String sizeGlass;
  const CoffeeSize({super.key, required this.sizeGlass});

  @override
  State<CoffeeSize> createState() => _CoffeeSizeState();
}

class _CoffeeSizeState extends State<CoffeeSize> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          // padding: EdgeInsets.only(left: 5),
          alignment: Alignment.center,
          height: 40,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1), // Warna bayangan
                  spreadRadius: 1, // Seberapa jauh bayangan menyebar dari objek
                  blurRadius: 2, // Seberapa buram bayangan
                  offset: Offset(1, 1), // Posisi bayangan (X,Y)
                ),
              ]),
          child: Text(
            widget.sizeGlass,
            style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black),
          ),
        ),
      ],
    );
  }
}

class DescCoffee extends StatelessWidget {
  final String desc;
  const DescCoffee({
    super.key,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      desc,
      style: GoogleFonts.lato(fontSize: 12, fontWeight: FontWeight.normal),
    );
  }
}

class ButtonCart extends StatelessWidget {
  final String harga;
  const ButtonCart({
    super.key,
    required this.harga,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35),
      height: 75,
      width: 330,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35), color: Colors.brown),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            height: 75,
            width: 210,
            decoration: BoxDecoration(
                border:
                    Border(right: BorderSide(width: 1, color: Colors.white))),
            child: Text(
              'Add to Cart',
              style: GoogleFonts.lato(fontSize: 20, color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            // color: Colors.black,
            alignment: Alignment.center,
            height: 75,
            width: 120,
            child: Text(
              harga,
              style: GoogleFonts.lato(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            // width: 235,
            // decoration: BoxDecoration(border: Border(right: BorderSide(width: 1,color: Colors.white)
            // )),
          ),
        ],
      ),
    );
  }
}
