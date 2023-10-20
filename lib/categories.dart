import 'package:coffeshop/detail_coffee.dart';
import 'package:coffeshop/model/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Kategori extends StatefulWidget {
  const Kategori({super.key});

  @override
  State<Kategori> createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  String selectedCtegory = '';
  @override
  Widget build(BuildContext context) {
    final List<CoffeeList> coffeesEspresso = [
      CoffeeList(
          'Cafe Latte',
          'assets/images/kopi.jpg',
          '20 K',
          '4.9',
          'Chocolate',
          'Latte is Italian for milk. As the name implies, the flavor of cafe latte is more dominant in milk than espresso. The appearance of cafe latte is similar to cappuccino.',
          'Based Espresso'),
      CoffeeList(
          'Long Machiato',
          'assets/images/lmachi.jpg',
          '15 K',
          '4.5',
          '',
          'Macchiato is a single shot or double shot espresso with an additional tablespoon of hot milk or milk froth. This type of coffee is served in a small cup.',
          'Based Espresso'),
      CoffeeList(
          'Lungo',
          'assets/images/lungo.jpg',
          '15 K',
          '4.7',
          '',
          'Derived from the Italian word for "long", compared to ristretto and espresso, lungo coffee is extracted for a longer time.  If espresso is usually extracted for 30 seconds, then lungo can be as long as 1 minute, with a standard shot size of 130-170 ml.',
          'Based Espresso'),
      CoffeeList(
          'Short Machiato',
          'assets/images/smachi.jpg',
          '15 K',
          '4.4',
          '',
          'Short macchiato is a coffee drink that is actually almost similar to its base ingredient, Espresso. The difference is that short macchiato is given a little hot milk and foam so that the taste is not as strong as Espresso.',
          'Based Espresso'),
      CoffeeList(
          'Americano',
          'assets/images/amerikano.jpg',
          '10 K',
          '4.4',
          '',
          'The concoction of this coffee drink is also quite simple. The combination of americano is just Espresso and warm water.',
          'Based Espresso'),
      CoffeeList(
          'Palm Coffee',
          'assets/images/kopi2.jpg',
          '18 K',
          '4.9',
          'Caramel',
          'Cappuccino has the exact same ingredients as a latte. The difference here is in the dosage and composition.',
          'Based Espresso'),
    ];
    final List<CoffeeList> coffeesManual = [
      CoffeeList(
          'Frenchpress',
          'assets/images/french.jpg',
          '15 K',
          '4.4',
          '',
          'French Press is commonly referred to as a coffee press. The technique in serving coffee is made with a special glass. If you will see a glass shape that has a pressing tool on the lid of the glass, then it is a tool called a French Press.',
          'Based Espresso'),
      CoffeeList(
          'Aeropress',
          'assets/images/aero.jpg',
          '16 K',
          '4.4',
          '',
          'The Aeropress is an efficient coffee maker that requires only a simple press to use. This tool produces delicious espresso-type coffee in a fast time. The process of using aeropress, you add an aeropress filter and put the ground coffee beans. Pour hot water in it. Let it sit for a few minutes, then push the plunger to filter the coffee.',
          'Based Espresso'),
      CoffeeList(
          'Cold Brew',
          'assets/images/coldbrew.jpg',
          '12 K',
          '4.7',
          '',
          'Cold brew is one of the unique coffee brewing techniques because it does not use hot water. You simply mix coarsely ground coffee beans with cold water. Then, it is left for a few hours or overnight. After that, it is filtered from the grounds and can be served with additional ice cubes.',
          'Based Espresso'),
      CoffeeList(
          'V60',
          'assets/images/v60.jpg',
          '12 K',
          '4.7',
          '',
          'Teknik V60 ini merupakan teknik yang banyak digemari dan dicari di coffee shop lokal. Untuk menyeduh kopi, kamu membutuhkan sebuah kertas filter khusus yang berbentuk kerucut sebagai wadah bagi biji kopi yang sudah digiling, kemudian siram bubuk kopi dengan air panas.',
          'Based Espresso'),
    ];
    return Container(
        padding: EdgeInsets.only(left: 20, right: 10),
        width: 376,
        // color: Colors.amber,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10.0),
              // color: Colors.amber,
              width: 350,
              child: Text(
                'Categories',
                style:
                    GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryOpt(
                  logo: Icons.coffee,
                  name: 'Manual Brew',
                  selectedCtegory: selectedCtegory,
                  onCategorySelected: (category) {
                    setState(() {
                      selectedCtegory = category;
                    });
                  },
                ),
                CategoryOpt(
                    logo: Icons.coffee,
                    name: 'Based Espresso',
                    selectedCtegory: selectedCtegory,
                    onCategorySelected: (category) {
                      setState(() {
                        selectedCtegory = category;
                      });
                    }),
              ],
            ),
            CategoriesContent(
              coffeesEspresso: coffeesEspresso,
              coffeesManual: coffeesManual,
              selectedCtegory: selectedCtegory,
            ),
          ],
        ));
  }
}

class CategoriesContent extends StatefulWidget {
  final List<CoffeeList> coffeesManual;
  final List<CoffeeList> coffeesEspresso;
  const CategoriesContent({
    super.key,
    required this.selectedCtegory,
    required this.coffeesManual,
    required this.coffeesEspresso,
  });

  final String selectedCtegory;

  @override
  State<CategoriesContent> createState() => _CategoriesContentState();
}

class _CategoriesContentState extends State<CategoriesContent> {
  @override
  Widget build(BuildContext context) {
    List<CoffeeList> displayedCoffee = [];
    if (widget.selectedCtegory == 'Manual Brew') {
      displayedCoffee = widget.coffeesManual;
    } else if (widget.selectedCtegory == 'Based Espresso') {
      displayedCoffee = widget.coffeesEspresso;
    }
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        // crossAxisSpacing: 15,
        // mainAxisExtent: 170
      ),
      itemCount: displayedCoffee.length,
      physics:
          NeverScrollableScrollPhysics(), // Untuk mencegah scroll di dalam GridView
      itemBuilder: (context, index) {
        final coffee = displayedCoffee[index];

        return Stack(
          children: [
            Container(
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

              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      // print(widget.coffeesManual.length as String?);
                      // print('p');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailContent(coffee: coffee),
                          ));
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 8, left: 8, right: 8),
                          child:
                              Stack(alignment: Alignment.topRight, children: [
                            Container(
                              height: 100,
                              width: 200,
                              alignment: Alignment.topCenter,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  coffee.image_coffee,
                                  fit: BoxFit.fill,
                                  height: 100,
                                  width: 200,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 20,
                                width: 42,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color.fromARGB(255, 132, 96, 70)),
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
                                      coffee.rating,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      coffee.name,
                                      style: GoogleFonts.lato(fontSize: 15),
                                    ),
                                    Text(
                                      coffee.topping,
                                      style: GoogleFonts.lato(fontSize: 8),
                                    ),
                                    Text(
                                      coffee.price,
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
                                        color:
                                            Color.fromARGB(255, 132, 96, 70)),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class CategoryOpt extends StatefulWidget {
  final String name;
  final IconData logo;
  final String selectedCtegory;
  final Function(String) onCategorySelected;

  const CategoryOpt({
    Key? key,
    required this.name,
    required this.logo,
    required this.selectedCtegory,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  _CategoryOptState createState() => _CategoryOptState();
}

class _CategoryOptState extends State<CategoryOpt> {
  bool isCircle = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onCategorySelected(widget.name);
        // setState(() {
        //   isCircle = !isCircle;
        // });
      },
      child: Card(
        elevation: 0,
        color: widget.name == widget.selectedCtegory
            ? Colors.brown // Ganti warna sesuai kebutuhan
            : null,
        shape: widget.name == widget.selectedCtegory
            ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    50)), // Hapus bentuk bulat jika tidak diperlukan
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
          child: Row(
            children: [
              Icon(
                widget.logo,
                color: widget.name == widget.selectedCtegory
                    ? Colors.white
                    : Colors.black,
              ),
              SizedBox(
                width: 7,
              ),
              Text(widget.name,
                  style: TextStyle(
                      fontSize: 12,
                      color: widget.name == widget.selectedCtegory
                          ? Colors.white
                          : Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}
