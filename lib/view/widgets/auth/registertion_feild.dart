import 'package:flutter/material.dart';

class CustomFromFeild extends StatelessWidget {
  const CustomFromFeild(
      {super.key,
      required this.hint,
      required this.title,
      required this.controller,
      required this.icon,
      required this.valid,
      required this.isnumber,
      this.obscureText,
      this.onTapIcon});
  final String hint;
  final String title;
  final IconData icon;
  final String? Function(String?) valid;
  final void Function()? onTapIcon;
  final TextEditingController controller;
  final bool isnumber;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        obscureText: obscureText == null || obscureText == false ? false : true,
        keyboardType: isnumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: controller,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: InkWell(
            onTap: onTapIcon,
            child: Icon(icon, color: const Color.fromARGB(255, 4, 122, 107)),
          ),
          label: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          hintText: hint,
          hintStyle: const TextStyle(
              color: Color.fromARGB(255, 20, 20, 20), fontSize: 10),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: const BorderSide(color: Colors.grey)),
        ),
      ),
    );
  }
}
