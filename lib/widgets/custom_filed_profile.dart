import 'package:flutter/material.dart';

class CustomFiledProfile extends StatelessWidget {
  const CustomFiledProfile({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
  });
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      controller: controller,
      cursorHeight: 20,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(color: Colors.black),
        labelText: labelText,

        labelStyle: TextStyle(color: Colors.black),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
