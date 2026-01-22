import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../shared/custom_button.dart';
import '../widgets/spicy_slider.dart';
import '../widgets/topping_card.dart';

class ProductDetailsView extends StatefulWidget {
   const ProductDetailsView({super.key});

   @override
   State<ProductDetailsView> createState() => _ProductDetailsViewState();
 }

 class _ProductDetailsViewState extends State<ProductDetailsView> {
  double value = 0.5;
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.white,
         scrolledUnderElevation: 0,
       ),
       body: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 15.0),
         child: SingleChildScrollView(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               SpicySlider(
                 value: value,
                 onChanged:(v) => setState(() => value = v),
               ),
               Gap(50),
               Text('Toppings',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
               Gap(20),
               SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                 child: Row(
                   children:List.generate(4, (index){
                     return Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
                       child: ToppingCard(image: 'assets/topping/tomato.png', title: 'Tomato',),
                     );
                   }
                   )
                 ),
               ),
               Gap(30),
               Text('Side options',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
               Gap(20),
               SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                 child: Row(
                   children:List.generate(4, (index){
                     return Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
                       child: ToppingCard(image: 'assets/topping/tomato.png', title: 'Tomato',),
                     );
                   }
                   )
                 ),
               ),
               Gap(50),
               Row(
                 children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('Total:',style: TextStyle(fontSize: 20),),
                       Text('\$ 18.5',style: TextStyle(fontSize: 27),)
                     ],
                   ),
                   Spacer(),
                   CustomButton(text: 'Add To Cart',),
                 ],
               ),
               Gap(50)
             ],
           ),
         ),
       ),

     );
   }
 }
