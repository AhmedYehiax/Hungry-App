import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constant/app_colors.dart';
import '../../../shared/custom_txtfield.dart';
import '../widgets/custom_btn.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passcontroller = TextEditingController();
    TextEditingController confcontroller = TextEditingController();
    TextEditingController namcontroller = TextEditingController();
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

    return Scaffold(
      body: Center(
          child: Form( // Added Form widget here
            key: _formkey, // Connected the form key
            child: Column(
              children: [
                const Gap(100),
                Image.asset('assets/splash/Hungry.png', width: 300,color: AppColors.primarycolor,),
                const Gap(50),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primarycolor,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                    ),
                  padding: const EdgeInsets.all(20),
                
                  child: Column(
                    children: [
                      const Gap(30),
                      CustomTxtfield(
                  hint: 'Name',
                  ispassword: false,
                  controller: namcontroller,
                ),
                const Gap(25),
                CustomTxtfield(
                  hint: 'Email',
                  ispassword: false,
                  controller: emailcontroller,
                ),
                const Gap(25),
                CustomTxtfield(
                  hint: 'Password',
                  ispassword: true,
                  controller: passcontroller,
                ),
                const Gap(25),
                CustomTxtfield(
                  hint: 'Confirm Password',
                  ispassword: true,
                  controller: confcontroller,
                ),
                const Gap(30),
                CustomAuthBtn(
                  text: 'Sign Up',
                  onTap:() {
                    if (_formkey.currentState!.validate()) {
                      print('Success Register');
                    }
                    },
                )
                    ]
                ),),),
                
                // GestureDetector(
                //   onTap: () {
                //     if (_formkey.currentState!.validate()) {
                //       print('Success Register');
                //       // Add your signup logic here
                //     }
                //   },
                //   child: Container(
                //     height: 55,
                //     width: double.infinity,
                //     decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(10)
                //     ),
                //     child: Center(
                //       child: Text(
                //         'Sign Up',
                //         style: TextStyle(
                //             color: AppColors.primarycolor,
                //             fontSize: 20
                //         ),
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
    
    );
  }
}