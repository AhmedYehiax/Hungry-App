import 'package:flutter/material.dart';

import '../core/constant/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onTap, this.width, this.heigth});
  final String text;
  final Function()? onTap;
  final double? width;
  final double? heigth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: heigth ?? 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primarycolor
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 15),
          child: Center(child: Text(text,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),)),
        ),
      ),
    );
  }
}
