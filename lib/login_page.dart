import 'package:coffeshop/nyar/login_user.dart';
import 'package:coffeshop/screen/home_page.dart';
import 'package:coffeshop/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final dataProvider = Provider.of<CoffeeList>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.saturation),
              child: Image.asset(
                'assets/images/loginpage.jpg',
                fit: BoxFit.cover,
                height: double.infinity,
                alignment: Alignment.center,
              ),
            ),
            // Positioned(
            //     top: 40,
            //     child: Text(
            //       '"Refresh Your Mind"',
            //       style: GoogleFonts.montserrat(
            //           color: Color.fromARGB(126, 252, 251, 251),
            //           fontSize: 30,
            //           fontStyle: FontStyle.italic),
            //     )),
            // login place
            Positioned(
                bottom: 60,
                right: 10,
                left: 10,
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Column(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 10),
                      Container(
                        // padding: EdgeInsets.only(bottom: ),
                        width: 210,
                        height: 110,
                        child: Text(
                          'Good Coffee, Good Friends, let it blends',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      // ),
                      // Get Started
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          hoverColor: Colors.black,
                          onTap: () {
                            
                            // dataProvider.connectAPI();
                            // Tindakan yang ingin Anda lakukan saat card diklik

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  // builder: (context) => MainScreen(),
                                  builder: (context) => Login(),
                                ));
                          },
                          child: Card(
                            color: Color.fromARGB(255, 132, 96, 70),
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Image.asset(
                                //   'assets/images/logo_google.jpg',
                                //   width: 25,
                                // ),
                                SizedBox(
                                  width: 5,
                                  height: 55,
                                ),
                                Text(
                                  'Get Started',
                                  style: GoogleFonts.lato(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Padding(padding: EdgeInsets.all(8.0)),
                      // Consumer<CoffeeList>(builder: (context, value, child) {
                      //   if (value.data["name"] == null) {
                      //     return Text(
                      //       'Terhubungnya kita akan memunculkan banyak inspirasimu!',
                      //       textAlign: TextAlign.center,
                      //       style: GoogleFonts.montserrat(
                      //         color: Colors.white,
                      //         fontSize: 13,
                      //         fontStyle: FontStyle.italic,
                      //       ),
                      //     );
                      //   } else {
                      //     return Text(
                      //       value.data["name"],
                      //       textAlign: TextAlign.center,
                      //       style: GoogleFonts.montserrat(
                      //         color: Colors.white,
                      //         fontSize: 13,
                      //         fontStyle: FontStyle.italic,
                      //       ),
                      //     );
                      //   }
                      // }),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
