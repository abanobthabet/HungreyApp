import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/widgets/custom_botton.dart';

class Orderhistoryview extends StatelessWidget {
  const Orderhistoryview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                child: Card(
                  elevation: 1,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/images/hungry.png', width: 100),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 15.0,
                                right: 15,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    'Hamburger',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text('Qty  :  x3', style: TextStyle()),
                                  Text(r'20 $', style: TextStyle()),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Gap(20),
                        CustomBotton(
                          text: 'Order Again',
                          width: double.infinity,
                          height: 50,
                          color: primrycolor.withOpacity(0.5),
                          textcolor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
