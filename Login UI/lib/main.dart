import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 251, 249, 249),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      width: double.infinity,
                      height: 450,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(184, 255, 21, 130),
                            Color.fromARGB(135, 223, 10, 81),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),

                        /* borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(400, 200),
                        ),*/
                      ),
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
                        color: Color.fromARGB(255, 150, 150, 158),
                      ),
                    ),
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: IconButton(
                      onPressed: () {},
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
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height * 0.6);

    path.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.45, 
      size.width * 0.6,
      size.height * 0.75,
    );

    path.quadraticBezierTo(
      size.width * 0.85,
      size.height * 1.0, 
      size.width,
      size.height * 0.7, 
    );

    
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; 
  }
}
