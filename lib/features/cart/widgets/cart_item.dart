import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../core/constant/app_colors.dart';
import '../../../shared/custom_button.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.image, required this.text, required this.desc, this.onAdd, this.onMin, this.onRemove, required this.number});
  final String image, text, desc;
  final Function() ? onAdd;
  final Function() ? onMin;
  final Function() ? onRemove;
  final int number;



  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(widget.image,height: 100,),
                Text(widget.text,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18),),
                Text(widget.desc)
              ],
            ),
            Spacer(),
            Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: widget.onMin,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.primarycolor
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.remove,color: Colors.white,),
                        ),
                      ),
                    ),
                    Gap(25),
                    Text(widget.number.toString(),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                    Gap(25),
                    GestureDetector(
                      onTap: widget.onAdd,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.primarycolor
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.add,color: Colors.white,),
                        ),
                      ),
                    )
                  ],
                ),
                Gap(40),
                CustomButton(text: 'Remove',onTap: widget.onRemove,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
