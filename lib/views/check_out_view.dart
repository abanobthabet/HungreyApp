import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/widgets/custo_list_tile.dart';
import 'package:hungry_app/widgets/custom_botton.dart';
import 'package:hungry_app/widgets/order_details.dart';
import 'package:hungry_app/widgets/widget_check_out.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  String groupValue = 'cash';
  bool ischecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, scrolledUnderElevation: 0),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderDetails(
                order: r'$16.48',
                taxes: r'$0.3',
                deliveryfees: r'$1.5',
                total: r'$18.19',
              ),
              const Gap(55),
              const Text(
                'Payment methods',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Gap(20),
              CustomListTile(
                onTap: () {
                  setState(() {
                    groupValue = 'cash';
                  });
                },
                color: const Color(0xff3C2F2F),
                image: 'assets/images/dolar.png',
                title: 'Cash  Delivery',
                value: 'cash',
                groupValue: groupValue,
                onChanged: (v) {
                  setState(() {
                    groupValue = v!;
                  });
                },
              ),
              const Gap(20),
              CustomListTile(
                onTap: () {
                  setState(() {
                    groupValue = 'card';
                  });
                },
                color: Colors.grey.shade400,
                image: 'assets/images/visa.png',
                title: 'Visa / Mastercard',
                subtitle: '3566 **** **** 0505',
                value: 'card',
                groupValue: groupValue,
                onChanged: (v) {
                  setState(() {
                    groupValue = v!;
                  });
                },
              ),
              Gap(10),

              Row(
                children: [
                  Checkbox(
                    value: ischecked,
                    onChanged: (v) {
                      setState(() {
                        ischecked = v!;
                      });
                    },
                  ),
                  Text(
                    'Save card details for future payments',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              Gap(300),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 105,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 5, offset: Offset(0, -1))],
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),

        width: double.infinity,
        child: Card(
          color: Colors.white,
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Gap(15),
                    Text(
                      'Total Price',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    Gap(5),
                    Text(
                      r'$ 18.19',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                CustomBotton(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 180,
                            horizontal: 10,
                          ),
                          child: Dialog(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: primrycolor,
                                    radius: 30,
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  Gap(15),
                                  Text(
                                    'Success !',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: primrycolor,
                                    ),
                                  ),
                                  Gap(10),
                                  Text(
                                    'Your order has been\n placed successfully',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Gap(15),
                                  CustomBotton(
                                    text: 'close',
                                    width: 220,
                                    height: 60,
                                    color: primrycolor,
                                    textcolor: Colors.white,
                                    onTap: () => Navigator.pop(context),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  color: primrycolor,
                  text: 'Pay Now',
                  textcolor: Colors.white,
                  height: 60,
                  width: 130,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
