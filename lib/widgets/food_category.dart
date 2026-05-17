import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/views/productDetails.dart';

class FoodCategory extends StatelessWidget {
  FoodCategory({super.key, required this.onPressed, required this.isSelected});
  Function()? onPressed;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Productdetails();
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  primrycolor,
                  primrycolor.withOpacity(0.9),
                  primrycolor.withOpacity(0.8),
                ],
              ),
            ),

            child: Padding(
              padding: const EdgeInsets.only(
                left: 12,
                right: 12,
                top: 12,
                bottom: 12,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Center(
                    child: Image.asset('assets/images/burger.png', width: 100),
                  ),
                  Gap(7),
                  Text(
                    'Cheeseburger',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Wendy\'s Burger',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Icon(Icons.star, color: Colors.white, size: 18),
                      Text(
                        ' 4.9',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(flex: 1),
                      GestureDetector(
                        onTap: onPressed,
                        child: Icon(
                          Icons.favorite,
                          color: isSelected ? Colors.red : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
