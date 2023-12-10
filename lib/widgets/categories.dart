import 'package:coffeshop/widgets/coffee_item.dart';
import 'package:coffeshop/widgets/detail_coffee.dart';
import 'package:coffeshop/model/model.dart';
import 'package:coffeshop/screen/detail_coffee.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Kategori extends StatefulWidget {
  const Kategori({super.key});

  @override
  State<Kategori> createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this);
  // String selectedCtegory = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TabBar(
            indicatorColor: Colors.brown,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 24),
            indicatorSize: TabBarIndicatorSize.tab,
            controller: _tabController,
            tabs: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 7),
                child: Text("Manual Brew",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.w900)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 7),
                child: Text("Based Epresso",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.w900)),
              ),
            ]),
        Container(
          // color: Colors.amber,
          width: 346,
          // padding: EdgeInsets.only(left: 32,),
          // width: MediaQuery.of(context).size.width,
          height: 400,
          //  width: double.infinity,
          child: TabBarView(controller: _tabController,  physics: AlwaysScrollableScrollPhysics() ,children: [
            GridItem(kategori: "Manual Brew"),
            GridItem(
              kategori: "Based Espresso",
            ),
            
          ]),
        ),
      ],
    );
  }
}
