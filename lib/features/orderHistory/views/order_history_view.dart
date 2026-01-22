import 'package:flutter/material.dart';
import '../../../shared/custom_button.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView.builder(
          padding: EdgeInsets.only(bottom:120 ,top:20 ),
          itemCount: 3,
          itemBuilder: (context, index){
            return Card(
              color: Colors.white,
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/home/item-2.jpg',width: 125,),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Hamburgerdddddd',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),),
                            Text('Qty : X3',
                              style: TextStyle(
                                  fontSize: 18),),
                            Text('Price : 20\$',
                              style: TextStyle(
                                  fontSize: 18),),

                          ],
                        )
                      ],
                    ),
                    CustomButton(text: 'Re-Order',width: double.infinity,)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
