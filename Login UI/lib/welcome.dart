import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDDDDDD),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // ignore: sized_box_for_whitespace
                Container(
                  width: double.infinity,
                  height: 450, 
                  child: Image.asset(
                    "images/Frame.png",
                    fit: BoxFit.cover,
                    alignment: Alignment
                        .bottomCenter, 
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(1),
              padding: EdgeInsets.all(15),
              child: Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 23,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                "Lorem ipsum dolor sit amet consectetur adipisicing elit. Ducimus consectetur nulla eveniet architecto eaque tempore?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 150, 150, 158),
                ),
              ),
            ),
            SizedBox(height: 60),
            Row(
              children: [
                Spacer(),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF737373),
                    ),
                  ),
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Loginpage()),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_circle_right_rounded,
                      color: Color.fromARGB(163, 163, 27, 127),
                      size: 50,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
