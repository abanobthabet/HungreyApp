import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/widgets/widget_check_out.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({
    super.key,
    required this.order,
    required this.taxes,
    required this.deliveryfees,
    required this.total,
  });
  final String order;
  final String taxes;
  final String deliveryfees;
  final String total;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order summary',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
        ),
        Gap(5),
        WidgetCheckOut(
          issmall: false,
          colorprice: Colors.grey,
          colortitle: Colors.grey,
          title: 'Order',
          price: order,
        ),
        Gap(5),
        WidgetCheckOut(
          issmall: false,
          colorprice: Colors.grey,
          colortitle: Colors.grey,
          title: 'Taxes',
          price: taxes,
        ),
        Gap(5),
        WidgetCheckOut(
          issmall: false,
          colorprice: Colors.grey,
          colortitle: Colors.grey,
          title: 'Delivery fees',
          price: deliveryfees,
        ),
        Gap(5),
        Divider(thickness: 0.5),
        Gap(10),
        WidgetCheckOut(
          issmall: false,
          colorprice: Colors.black,
          colortitle: Colors.black,
          fontWeighttitle: FontWeight.bold,
          fontWeightprice: FontWeight.bold,
          title: 'Total:',
          price: total,
        ),
        Gap(10),
        WidgetCheckOut(
          issmall: true,
          colorprice: Colors.black,
          colortitle: Colors.black,
          fontWeighttitle: FontWeight.bold,
          fontWeightprice: FontWeight.bold,
          title: 'Estimated delivery time:',
          price: r'15 - 30 mins',
        ),
      ],
    );
  }
}
