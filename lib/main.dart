import 'package:coffeshop/controllers/coffee_provider.dart';
import 'package:coffeshop/controllers/fav_provider.dart';
import 'package:coffeshop/controllers/main_provider.dart';
import 'package:coffeshop/login_page.dart';
import 'package:coffeshop/screen/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './model/model.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<MainScreenNotifier>(
        create: (_) => new MainScreenNotifier()),
    ChangeNotifierProvider<CoffeeListProvider>(
      create: (_) => new CoffeeListProvider(),
    ),
    ChangeNotifierProvider<FavProvider>(
      create: (_) => new FavProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: LoginPage()),
      // home: MultiProvider(providers: [
      //   ChangeNotifierProvider<MainScreenNotifier>(
      //       create: (_) => new MainScreenNotifier()),
      //   ChangeNotifierProvider<CoffeeProvider>(
      //     create: (_) => new CoffeeProvider(),
      //   ),
      // ], child: LoginPage()),
    );
  }
}
