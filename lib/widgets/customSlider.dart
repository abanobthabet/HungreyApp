import 'package:flutter/material.dart';
import 'package:hungry_app/core/utils/constant.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double value = 0.3;
  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 0,
      max: 1,
      value: value,
      onChanged: (v) {
        value = v;
        setState(() {});
      },
      inactiveColor: Colors.grey,
      activeColor: primrycolor,
    );
  }
}
