import 'package:flutter/material.dart';

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