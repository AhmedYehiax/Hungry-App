import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/shared/custom_button.dart';

import '../widgets/order_detials_widget.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  String _selectedPaymentMethod = 'Cash';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order Summary',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            Gap(10),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child:OrderDetialsWidget(
                order: '18',
                taxes: '3.5',
                fees: '2.5',
                total: '24',
              )
            ),
            Text('Payment methods',style: TextStyle(fontSize: 20,
            fontWeight: FontWeight.w500),
            ),
            Gap(10),
           ListTile(
            onTap:  () {
                    setState(() { 
                      _selectedPaymentMethod = 'Cash'; });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),),
              tileColor: Color(0xFF3c2f2f),
                contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 5 ),
                leading: Image.asset('assets/checkout/dollar Background Removed 1.png',width: 50,),
                title: Text('Cash on Delivery',style: TextStyle(color: Colors.white),),
                trailing: Radio(
                  activeColor: Colors.white,
                  value: 'Cash',
                 groupValue: _selectedPaymentMethod,
                  onChanged: (value) { 
                    setState(() { 
                      _selectedPaymentMethod == value!; }); }),
              ),
               Gap(10),
           ListTile(
            onTap:  () {
                    setState(() { 
                      _selectedPaymentMethod = 'credit_card'; });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),),
                contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 5 ),
                leading: Image.asset('assets/checkout/image 13.png',width: 50,),
                title: Text('Debit card',style: TextStyle(color: Colors.black),),
                subtitle: Text('**** **** **** 3947',style: TextStyle(color: Colors.black),),
                trailing: Radio(
                  activeColor: Colors.black,
                  value: 'credit_card',
                 groupValue: _selectedPaymentMethod,
                  onChanged: (value) { 
                    setState(() { 
                      _selectedPaymentMethod = value!; }); }),
              ),
          Gap(20),
          Row(
            children: [
              Checkbox(
                activeColor: Color(0xFFEF2A39),
                value: true,
               onChanged: (value) {  },),
              Text('Save card details for future payments',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500
              ),),
            ],
          )
          ],
        ),
      ),
      bottomSheet: Container(
        height: 120,
        color: Colors.white,
        child:
      Padding(padding:  EdgeInsets.symmetric(horizontal: 25,vertical: 20),
       child:
      Row(
          crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('Total:',style: TextStyle(fontSize: 20),),
                       Text('\$ 18.5',style: TextStyle(fontSize: 27,fontWeight: FontWeight.w600),)
                     ],
                   ),
                   Spacer(),
                   CustomButton(text: 'Pay Now',onTap: () {
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        icon: Image.asset('assets/checkout/Screenshot 2026-01-12 175636.png',width: 80,height: 80,),
                        title: Center(
                          child: Text('Success !',style: TextStyle(color: Color(0xFF08431D)),),
                        ),
                        content: Text('Your payment was successful.\nA receipt for this purchase has been sent to your email.'
                        ,textAlign: TextAlign.center,),
                        actions: [
                          Center(
                            child: CustomButton(
                              width: 150,
                              text: 'Go Back',
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                            )
                          ),
                        ],
                      );
                    });
                   }
                   )
                 ],
               ),
      ),
    ),
    );

  }
}
