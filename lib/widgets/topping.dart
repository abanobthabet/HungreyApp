import 'package:flutter/material.dart';

class ToppingAndOptions extends StatelessWidget {
  const ToppingAndOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 69,
          width: 95,
          decoration: BoxDecoration(
            color: Color(0xff3C2F2F),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          top: -45,
          child: Card(child: Image.asset('assets/images/onion.png')),
        ),

        Positioned(
          left: 0,
          right: 0,
          bottom: 8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Onions',
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
                CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 10,
                  child: Icon(Icons.add, color: Colors.white, size: 13),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
