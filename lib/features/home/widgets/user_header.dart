import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../core/constant/app_colors.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/logo/Hungry_.svg',color: AppColors.primarycolor,height: 35,),
            Gap(5),
            Text('HI, Ahmed Yehia',style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 18,
                fontWeight: FontWeight.w500
            ),),
          ],
        ),
        Spacer(),
        CircleAvatar(radius: 33,backgroundColor: AppColors.primarycolor,child: Icon(Icons.person_outline,color: Colors.white,),)
      ],
    );
  }
}
