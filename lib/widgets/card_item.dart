import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/widgets/custom_botton.dart';

class CardItem extends StatelessWidget {
  CardItem({
    super.key,
    required this.number,
    this.onadd,
    this.onremove,
    this.onremoveitem,
  });
  final int number;
  final Function()? onadd;
  final Function()? onremove;
  final Function()? onremoveitem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 185,
        width: double.infinity,
        child: Card(
          elevation: 1,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/hungry.png', width: 100),
                    Text(
                      'Hamburger',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Veggie Burger'),
                  ],
                ),
                Column(
                  children: [
                    Gap(20),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: onremove,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: primrycolor,
                            child: Icon(Icons.remove, color: Colors.white),
                          ),
                        ),
                        Gap(20),

                        Text(
                          '$number',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gap(20),
                        GestureDetector(
                          onTap: onadd,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: primrycolor,
                            child: Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Gap(30),
                    CustomBotton(
                      onTap: onremoveitem,
                      height: 43,
                      width: 154,
                      textcolor: Colors.white,
                      text: 'Remove',
                      color: primrycolor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
