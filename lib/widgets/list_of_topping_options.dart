import 'package:flutter/material.dart';
import 'package:hungry_app/widgets/topping.dart';

class ListOfToppingAndOptins extends StatelessWidget {
  const ListOfToppingAndOptins({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ToppingAndOptions(),
          );
        },
      ),
    );
  }
}
