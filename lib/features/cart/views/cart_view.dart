import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/checkout/views/checkout_view.dart';
import '../../../shared/custom_button.dart';
import '../widgets/cart_item.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int itemCount = 10;
  late List<int> quantities;
  @override
  void initState() {
    quantities= List.generate(itemCount, (_)=> 1);
    super.initState();
  }

  void onAdd(index){
    setState(() {
      quantities[index]++;
    });
  }
  void onMin(index){
    setState(() {
      if(quantities[index] > 1) {
        quantities[index]--;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 120,top: 40),
          itemCount: itemCount,
          itemBuilder: (context, index) => CartItem(
            image: 'assets/home/item-2.jpg',
            text: 'Hamburger',
            desc: 'Veggie Burger',
            number: quantities[index],
            onAdd: ()=> onAdd(index),
            onMin: ()=> onMin(index),
          ),
        ),
      ),

      bottomSheet: SafeArea(
        child: Container(
          height:100,
          padding: const EdgeInsets.all(15.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 8,
                color: Colors.black12,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Total:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gap(4),
                  Text(
                    '\$18.50',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              CustomButton(
                text: 'Checkout',
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_){
                   return CheckoutView();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
