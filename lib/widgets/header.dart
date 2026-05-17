import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/utils/constant.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'assets/images/Hungry.svg',
              height: 35,
              color: primrycolor,
            ),

            CircleAvatar(radius: 25),
          ],
        ),
        Gap(1),
        Text(
          'Hello, Rich Sonic',
          style: TextStyle(fontSize: 20, color: Color(0xff6A6A6A)),
        ),
      ],
    );
  }
}
