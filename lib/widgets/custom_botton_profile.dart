import 'package:flutter/material.dart';
import 'package:hungry_app/core/utils/constant.dart';

class CustomBottonPorfile extends StatelessWidget {
  const CustomBottonPorfile({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    required this.color,
    required this.textColor,
  });
  final String text;
  final IconData icon;
  final Function() onPressed;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: onPressed,
                child: Icon(icon, color: textColor, size: 19),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
