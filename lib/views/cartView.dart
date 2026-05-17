import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/views/check_out_view.dart';
import 'package:hungry_app/widgets/card_item.dart';
import 'package:hungry_app/widgets/custom_botton.dart';

class Cartview extends StatefulWidget {
  const Cartview({super.key});

  @override
  State<Cartview> createState() => _CartviewState();
}

class _CartviewState extends State<Cartview> {
  int itemCount = 20;
  late List<int> number;

  @override
  void initState() {
    number = List.generate(itemCount, (_) => 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        toolbarHeight: 20,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 150.0),
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return CardItem(
                  onadd: () {
                    number[index]++;
                    setState(() {});
                  },
                  onremove: () {
                    setState(() {
                      if (number[index] > 1) {
                        number[index]--;
                      }
                    });
                  },
                  number: number[index],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 100,
              left: 14,
              right: 14,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Gap(15),
                    Text('Total Price', style: TextStyle(fontSize: 15)),
                    Gap(5),
                    Text(
                      r'$ 18.19',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                CustomBotton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CheckOutView();
                        },
                      ),
                    );
                  },
                  color: primrycolor,
                  text: 'Check Out',
                  textcolor: Colors.white,
                  height: 50,
                  width: 150,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
