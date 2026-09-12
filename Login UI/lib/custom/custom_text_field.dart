import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final FaIconData icon;
  final Widget? suffixIcon;
  final String? Function(String?)? valid;
  final TextInputAction input;
  final bool ispass;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.valid,
    this.input = TextInputAction.done,
    this.ispass = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscuringCharacter: "*",
      obscureText: ispass,
      textInputAction: input,
      validator: valid,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hint,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FaIcon(icon),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0xFFFF8383),
            style: BorderStyle.solid,
            width: 3,
          ),
        ),
      ),
    );
  }
}

class Customputton extends StatelessWidget {
  final Widget widget;
  final void Function()? pressed;
  const Customputton({super.key, required this.widget, required this.pressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFFF8383),
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: pressed,
      child: widget,
    );
  }
}
