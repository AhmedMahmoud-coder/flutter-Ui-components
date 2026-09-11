import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDDDDDD),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              width: double.infinity,
              height: 380,
              child: Image.asset(
                "images/Frame-login.png",
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Sign in",
                style: TextStyle(
                  color: Color(0xFF404040),
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2.68,
                  decorationColor: Color(0xFFFF8383),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
