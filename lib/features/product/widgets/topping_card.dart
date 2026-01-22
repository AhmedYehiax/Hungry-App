import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ToppingCard extends StatelessWidget {
  const ToppingCard({super.key, required this.image, required this.title});
  final String image,title;


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        height: 180,
        width: 150,
        color: Color(0xff3C2F2F),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(image),
                )),
            Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Text(title,style: TextStyle(color: Colors.white,fontSize: 16),),
                  Spacer(),
                  Icon(Icons.add_circle_outlined,color: Colors.red,size: 30,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
