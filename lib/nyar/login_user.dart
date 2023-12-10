import 'package:coffeshop/main_screen.dart';
import 'package:coffeshop/nyar/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coffeshop/nyar/firebase_auth_service.dart';
// import 'package:coffeshop/nyar/home.dart';
import 'package:coffeshop/nyar/home_user.dart';
// import 'package:coffeshop/nyar/isi_login.dart';
import 'package:coffeshop/nyar/register_page.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final bool isTapped;
  final FirebaseAuthService _authService = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void login() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    User? user =
        await _authService.loginWithEmailandPassword(email, password, context);

    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Login success!"),
        backgroundColor: Colors.brown,
      ));
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Splash(),
          ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Login Failed!"),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login To Continue",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none),
                prefixIcon: Icon(Icons.email),
                filled: true,
                // prefixIconColor: isTapped ? Colors.brown : Colors.grey,
                hintText: "Email Addres",
              ),
            ),
            SizedBox(
              height: 12,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none),
                // fillColor: Color.fromARGB(255, 229, 229, 235),
                filled: true,
                prefixIcon: Icon(Icons.key),
                hintText: "Password",
              ),
              obscureText: true,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 55,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple),
                onPressed: () {
                  login();
                },
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Dont have an account?"),
                SizedBox(
                  width: 4,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: Text(
                    "Register.",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
