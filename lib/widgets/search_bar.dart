import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,

      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: "Search",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
