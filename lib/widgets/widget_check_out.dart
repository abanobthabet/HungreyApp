import 'package:flutter/material.dart';

class WidgetCheckOut extends StatelessWidget {
  WidgetCheckOut({
    super.key,
    required this.title,
    required this.price,
    this.fontWeighttitle,
    this.fontWeightprice,
    this.colortitle,
    this.colorprice,
    required this.issmall,
  });
  final String title;
  final String price;

  final FontWeight? fontWeighttitle;
  final FontWeight? fontWeightprice;
  final Color? colortitle;
  final Color? colorprice;
  bool issmall;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: fontWeighttitle,
              color: colortitle,
              fontSize: issmall! ? 12 : 18,
            ),
          ),
          Text(
            price,
            style: TextStyle(
              fontWeight: fontWeightprice,
              color: colorprice,
              fontSize: issmall! ? 12 : 18,
            ),
          ),
        ],
      ),
    );
  }
}
