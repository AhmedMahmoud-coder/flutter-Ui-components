import 'package:flutter/material.dart';
import 'package:flutter_application_1/Sign-up.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool pass = true;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDDDDDD),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ignore: sized_box_for_whitespace
              Container(
                width: double.infinity,
                height: 200,
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
                  style: GoogleFonts.oldenburg(
                    color: const Color(0xFF404040),
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2.68,
                    decorationColor: const Color(0xFFFF8383),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: formstate,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please Enter your Email";
                          } else if (!value.endsWith("@gmail.com")) {
                            return "Email Must End \"@gmail.com\"";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "demo@gmail.com",

                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: FaIcon(FontAwesomeIcons.solidEnvelope),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color(0xFFFF8383),
                              style: BorderStyle.solid,
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),

                      Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      TextFormField(
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password";
                          } else if (value.length < 8) {
                            return "Password must be at least 8 characters";
                          }
                          return null;
                        },
                        obscuringCharacter: "*",
                        obscureText: pass,
                        decoration: InputDecoration(
                          hint: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text("*********"),
                          ),
                          suffixIcon: IconButton(
                            icon: pass == false
                                ? FaIcon(
                                    FontAwesomeIcons.solidEye,
                                    size: 20,
                                    color: Color(0xFF404040),
                                  )
                                : FaIcon(
                                    FontAwesomeIcons.solidEyeSlash,
                                    size: 20,
                                    color: Color(0xFF404040),
                                  ),
                            onPressed: () {
                              pass = !pass;
                              setState(() {});
                            },
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 16, top: 8),
                            child: FaIcon(FontAwesomeIcons.lock, size: 22),
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.all(5),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color(0xFFFF8383),
                              style: BorderStyle.solid,
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Checkbox(
                            mouseCursor: SystemMouseCursors.click,
                            value: remember,
                            activeColor: Color(0xFFFF8383),
                            onChanged: (val) {
                              setState(() {
                                remember = !remember;
                              });
                            },
                          ),
                          Text(
                            "Remember me",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 211, 103, 103),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot password?",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 211, 103, 103),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 65),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF8383),
                          minimumSize: const Size(double.infinity, 55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          if (formstate.currentState!.validate()) {
                            // ignore: avoid_single_cascade_in_expression_statements
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.success,
                              animType: AnimType.scale,
                              title: 'Success',
                              desc: 'Data entry was successful',
                              btnOkOnPress: () {},
                            ).show();
                          } else {
                            // ignore: avoid_single_cascade_in_expression_statements
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.topSlide,
                              title: 'Error',
                              desc: 'Incorrect email or password',
                              btnOkColor: Color.fromARGB(255, 254, 1, 1),
                              btnOkOnPress: () {},
                            ).show();
                          }
                        },
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 252, 251, 251),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 7),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have an Account ?",
                            style: TextStyle(
                              color: Color(0xFF737373),
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),

                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SignUp(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFFFF8383),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
