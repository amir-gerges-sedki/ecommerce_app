import 'package:flutter/material.dart';

class CustomFromFeildAdmin extends StatelessWidget {
  const CustomFromFeildAdmin(
      {super.key,
      required this.title,
      required this.hinttitle,
      required this.controller,});
  final String title;
  final String hinttitle;
  final TextEditingController controller;
 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        controller: controller,
        // validator: valid,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: const Padding(
            padding: EdgeInsets.all(15),
            child: Icon(Icons.category_rounded,
                color: Color.fromARGB(255, 4, 122, 107)),
          ),
          label: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          hintText: hinttitle,
          hintStyle: const TextStyle(fontSize: 15),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
        ),
      ),
    );
  }
}
