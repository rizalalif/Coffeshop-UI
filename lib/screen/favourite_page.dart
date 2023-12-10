import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeshop/screen/detail_coffee.dart';
import 'package:coffeshop/service/data_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
  // final isManual = true;
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Favorite',style: GoogleFonts.montserrat(color: Colors.white),),
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.brown,
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: CoffeeService().getFav(true),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasError) {
                print("error");
                return Text(snapshot.error.toString());
              } else {
                List coffeList = snapshot.data!.docs;
                print("Stream data : ${coffeList}");
                return Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    itemCount: coffeList.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot documentSnapshot = coffeList[index];
                      Map<String, dynamic> data =
                          documentSnapshot.data() as Map<String, dynamic>;
                
                      return GestureDetector(
                        onTap: () {
                           Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailContent(coffee: data),
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(12),
                            elevation: 1,
                            child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          bottomLeft: Radius.circular(12))),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          bottomLeft: Radius.circular(12)),
                                      child: Image.network(
                                        data['img'],
                                        fit: BoxFit.cover,
                                        loadingBuilder: (context, child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          } else {
                                            return Center(
                                              child: CircularProgressIndicator(
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
                                      )),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data['name'],
                                      style: GoogleFonts.lato(),
                                    ),
                                    SizedBox(
                                      height: 44,
                                    ),
                                    Text('Rp.${data['price'].toString()}'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            }
          },
        ));
  }
}
