import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/widgets/custom_botton.dart';
import 'package:hungry_app/widgets/list_of_topping_options.dart';
import 'package:hungry_app/widgets/spicySlider.dart';
import 'package:hungry_app/widgets/topping.dart';

class Productdetails extends StatelessWidget {
  const Productdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(scrolledUnderElevation: 0, backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpicySlider(),
              Gap(50),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  'Add Toppings',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),

              Gap(50),
              ListOfToppingAndOptins(),
              Gap(20),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  'Side options',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Gap(50),
              ListOfToppingAndOptins(),
              Gap(200),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(22),
            topLeft: Radius.circular(22),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('Total Price', style: TextStyle(fontSize: 20)),
                  Text(
                    r'$ 18.19',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              CustomBotton(
                color: primrycolor,
                text: 'Add To Cart',
                textcolor: Colors.white,
                height: 65,
                width: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
