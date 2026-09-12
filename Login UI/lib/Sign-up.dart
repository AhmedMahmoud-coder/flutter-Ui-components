import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom/custom_text_field.dart';
import 'package:flutter_application_1/login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? password1;
  bool conpass = true;
  bool pass = true;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDDDDDD),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 140,
                child: Image.asset(
                  "images/Frame-signup.png",
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Sign up",
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
                padding: const EdgeInsets.all(8.0),
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
                      CustomTextField(
                        input: TextInputAction.next,
                        valid: (value) {
                          if (value == null || value.isEmpty) {
                            return "please Enter your Email";
                          } else if (!value.endsWith("@gmail.com")) {
                            return "Email Must End \"@gmail.com\"";
                          }
                          return null;
                        },
                        hint: "demo@gmail.com",
                        icon: FontAwesomeIcons.solidEnvelope,
                      ),

                      SizedBox(height: 30),

                      Text(
                        "Phone",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      CustomTextField(
                        keyboardType: TextInputType.phone,
                        input: TextInputAction.next,
                        valid: (value) {
                          if (value == null || value.isEmpty) {
                            return "please Enter your Phone number";
                          } else if (value.length < 11) {
                            return "Invalid phone number";
                          }
                          return null;
                        },
                        hint: "+20-01143765753",
                        icon: FontAwesomeIcons.phone,
                      ),

                      SizedBox(height: 30),

                      Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      CustomTextField(
                        ispass: pass,
                        suffixIcon: IconButton(
                          icon: pass == true
                              ? FaIcon(
                                  FontAwesomeIcons.solidEyeSlash,
                                  size: 20,
                                  color: Color(0xFF404040),
                                )
                              : FaIcon(
                                  FontAwesomeIcons.solidEye,
                                  size: 20,
                                  color: Color(0xFF404040),
                                ),
                          onPressed: () {
                            pass = !pass;
                            setState(() {});
                          },
                        ),
                        input: TextInputAction.next,
                        valid: (value) {
                          password1 = value;
                          if (value == null || value.isEmpty) {
                            return "please Enter The Password";
                          } else if (value.length < 8) {
                            return "Password must be at least 8 characters";
                          }
                          return null;
                        },
                        hint: "********",
                        icon: FontAwesomeIcons.lock,
                      ),

                      SizedBox(height: 30),

                      Text(
                        "Confirm Password",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      CustomTextField(
                        ispass: conpass,
                        suffixIcon: IconButton(
                          icon: conpass == true
                              ? FaIcon(
                                  FontAwesomeIcons.solidEyeSlash,
                                  size: 20,
                                  color: Color(0xFF404040),
                                )
                              : FaIcon(
                                  FontAwesomeIcons.solidEye,
                                  size: 20,
                                  color: Color(0xFF404040),
                                ),
                          onPressed: () {
                            conpass = !conpass;
                            setState(() {});
                          },
                        ),

                        valid: (value) {
                          if (value == null || value.isEmpty) {
                            return "please Enter The Password";
                          } else if (value.length < 8) {
                            return "Password must be at least 8 characters";
                          } else if (value != password1) {
                            return "Password isn't Confirm";
                          }
                          return null;
                        },
                        hint: "********",
                        icon: FontAwesomeIcons.lock,
                      ),
                      SizedBox(height: 30),
                      Customputton(
                        pressed: () {
                          if (formstate.currentState!.validate()) {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.success,
                              animType: AnimType.scale,
                              title: 'Success',
                              desc: 'The data was successfully saved✅',
                              btnOkOnPress: () {},
                            ).show();
                          }
                          return;
                        },
                        widget: Text(
                          "Sign UP",
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
                            "Already have an Account!",
                            style: TextStyle(
                              color: Color(0xFF737373),
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),

                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Sign in",
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
