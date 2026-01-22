import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrderDetialsWidget extends StatelessWidget {
  const OrderDetialsWidget({super.key, required this.order, required this.taxes, required this.fees, required this.total});
  final String order ,taxes ,fees ,total ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        checkoutWidget('Order','18 \$',false,false),
        Gap(10),
        checkoutWidget('Taxes','3.5 \$',false,false),
        Gap(10),
        checkoutWidget('Delivery fees','2.5 \$',false,false),
        Gap(10),
        Divider(),
        Gap(10),
        checkoutWidget('Total:', '24.4 \$',true,false),
        Gap(10),
        checkoutWidget('Estimated delivery time:','15 - 30 mins',true,true),
        Gap(50),
      ],
    );
  }
}
Widget checkoutWidget(title,price,isbold,isSmall){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
            fontSize: isSmall ? 14 : 16,
            fontWeight: isbold ? FontWeight.bold : FontWeight.w400,
            color: isbold ? Colors.black :Colors.grey.shade600
        ),
      ),
      Text(
        price,
        style: TextStyle(
            fontSize: isSmall ? 14 : 16,
            fontWeight: isbold ? FontWeight.bold : FontWeight.w400,
            color: isbold ? Colors.black :Colors.grey.shade600
        ),
      ),
    ],
  );
}