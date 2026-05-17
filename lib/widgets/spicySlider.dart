import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/widgets/customSlider.dart';

class SpicySlider extends StatelessWidget {
  const SpicySlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/pngwing 12.png', width: 150),
        Gap(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 13.0),
                child: Text(
                  'Customize Your Burger\n to Your Tastes.\n Ultimate Experience',
                ),
              ),
              Gap(10),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Spicy',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              CustomSlider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('0'), Text('0.5'), Text('1')],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
