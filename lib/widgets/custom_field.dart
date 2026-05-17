import 'package:flutter/material.dart';

class CustomField extends StatefulWidget {
  CustomField({
    super.key,
    required this.hintText,
    required this.controller,
    this.ispassword = false,
  });

  final String hintText;
  TextEditingController? controller;
  final bool ispassword;

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  late bool obscureText;
  @override
  void initState() {
    setState(() {
      obscureText = widget.ispassword;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      obscureText: obscureText,

      controller: widget.controller,
      validator: (v) {
        if (v?.isEmpty ?? true) {
          return 'please fill ${widget.hintText}';
        }
      },
      cursorHeight: 20,
      decoration: InputDecoration(
        fillColor: Colors.white,
        suffixIcon: widget.ispassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white,
                ),
              )
            : null,

        filled: true,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.black, fontSize: 15),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
