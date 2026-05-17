import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry_app/core/utils/constant.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({
    super.key,
    required this.text,
    this.onTap,
    required this.width,
    required this.height,
    this.color,
    this.textcolor,
    this.isLoading = false,
  });
  final String text;
  final Function()? onTap;
  final double width;
  final double height;
  final Color? color;
  final Color? textcolor;
  final bool? isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: isLoading == true
              ? CupertinoActivityIndicator(color: Colors.white)
              : Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textcolor ?? primrycolor,
                  ),
                ),
        ),
      ),
    );
  }
}
