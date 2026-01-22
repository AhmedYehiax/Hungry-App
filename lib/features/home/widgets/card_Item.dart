import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.image, required this.name, required this.decs, required this.rate});

final String image,name,decs,rate;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image,width: 170,),
            Gap(10),
            Text(name,
              style:TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),),
            Text(decs),
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('⭐ ${rate}'),
                Spacer(),
                Icon(Icons.favorite_outline)
              ],
            )
          ],
        ),
      ),
    );
  }
}
