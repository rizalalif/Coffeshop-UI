import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeshop/screen/detail_coffee.dart';
import 'package:coffeshop/service/data_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screen/favourite_page.dart';

class GridItem extends StatelessWidget {
  final String kategori;
  const GridItem({
    super.key,
    required this.kategori,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: CoffeeService().getCoffees(kategori),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            print("error");
            return Text(snapshot.error.toString());
          } else {
            List coffeeList = snapshot.data!.docs;

            return GridView.builder(
              // itemCount: coffeeList.length,
              itemCount: coffeeList.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                // crossAxisSpacing: 15,
                // mainAxisExtent: 170
              ),
            
              // physics:
              //     NeverScrollableScrollPhysics(), // Untuk mencegah scroll di dalam GridView
              itemBuilder: (context, index) {
                DocumentSnapshot documentSnapshot = coffeeList[index];
                Map<String, dynamic> data =
                    documentSnapshot.data() as Map<String, dynamic>;
                return Stack(children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2), // Warna bayangan
                          spreadRadius:
                              5, // Seberapa jauh bayangan menyebar dari objek
                          blurRadius: 7, // Seberapa buram bayangan
                          offset: Offset(0, 3), // Posisi bayangan (X,Y)
                        ),
                      ],
                    ),
                    height: 195,
                    width: 155,
                    // color: Colors.amber,
            
                    child: Column(children: [
                      InkWell(
                        onTap: () {
                          // print(widget.coffeesManual.length as String?);
                          // print('p');
                          // print(data);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailContent(coffee: data),
                              ));
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, left: 8, right: 8),
                              child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 200,
                                      alignment: Alignment.topCenter,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          data['img'],
                                          fit: BoxFit.cover,
                                          height: 100,
                                          width: 200,
                                          loadingBuilder: (context,
                                              child,
                                              ImageChunkEvent?
                                                  loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            } else {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                      color: Colors.brown,
                                                  value: loadingProgress
                                                              .expectedTotalBytes !=
                                                          null
                                                      ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          (loadingProgress
                                                                  .expectedTotalBytes ??
                                                              1)
                                                      : null,
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 20,
                                        width: 42,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Color.fromARGB(
                                                255, 132, 96, 70)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              size: 15,
                                              color: Colors.grey.shade200,
                                            ),
                                            Text(
                                              data['rating'],
                                              style: GoogleFonts.lato(
                                                  fontSize: 12,
                                                  color: Colors.grey.shade200),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ]),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                    // color: Colors.white,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data['name'],
                                          style: GoogleFonts.lato(fontSize: 15),
                                        ),
                                        Text(
                                          data['topping'],
                                          style: GoogleFonts.lato(fontSize: 8),
                                        ),
                                        Text(
                                          data['price'].toString(),
                                          style: GoogleFonts.lato(fontSize: 15),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 22,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 8.0, bottom: 10),
                                      child: Container(
                                        height: 33,
                                        width: 33,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color.fromARGB(
                                                255, 132, 96, 70)),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ]);
              },
            
              // CoffeeList coffee = coffeProvider.coffeList[index];
            );
          }
        });
  }
}
