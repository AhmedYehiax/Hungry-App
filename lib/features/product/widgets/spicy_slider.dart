import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constant/app_colors.dart';

class SpicySlider extends StatefulWidget {
  const SpicySlider({super.key, required this.value, required this.onChanged});
  final double value;
  final ValueChanged<double> onChanged;

  @override
  State<SpicySlider> createState() => _SpicySliderState();
}

class _SpicySliderState extends State<SpicySlider> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/details/product-details.png',height: 250),
        Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Customize Your Burger\n to Your Tastes. Ultimate\n Experience'),
            Gap(20),
            Text('Spicy',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            Slider(
              min: 0,
              max: 1,
              value: widget.value,
              onChanged: widget.onChanged,
              activeColor: AppColors.primarycolor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Text('🥶'),
                  Gap(140),
                  Text('🌶️')
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
