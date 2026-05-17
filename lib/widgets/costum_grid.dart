import 'package:flutter/material.dart';
import 'package:hungry_app/widgets/food_category.dart';

class CustomGrid extends StatefulWidget {
  CustomGrid({super.key});

  @override
  State<CustomGrid> createState() => _CustomGridState();
}

class _CustomGridState extends State<CustomGrid> {
  int isSelected = -1;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return FoodCategory(
          isSelected: isSelected == index,
          onPressed: () {
            setState(() {
              isSelected = index;
            });
          },
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
    );
  }
}
