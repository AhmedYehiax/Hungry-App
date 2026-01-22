import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constant/app_colors.dart';
import 'package:hungry/core/network/api_errors.dart';
import 'package:hungry/features/auth/data/auth_repo.dart';
import 'package:hungry/root.dart';
import 'package:hungry/shared/custom_txtfield.dart';
import '../widgets/custom_btn.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passcontroller = TextEditingController();
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
    
    AuthRepo authRepo = AuthRepo();
    Future<void> login() async {
       try {
      final user = await authRepo.login(
        emailcontroller.text.trim(),
        passcontroller.text.trim(),
      );
      if (user != null) Navigator.push(context, MaterialPageRoute(builder: (_) =>  Root()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e is ApiErrors ? e.message : 'Unhandled login error')),
      );
      }
    }


    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Form( // Added Form widget here
              key: _formkey, // Connect the form key
              child: Column(
                children: [
                  const Gap(100),
                  Image.asset('assets/splash/Hungry.png', width: 300,color: AppColors.primarycolor,),
                  const Gap(25),
                  Text(
                    'Welcome back',
                    style: TextStyle(
                      color: AppColors.primarycolor,
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    ),
                  ),
                  Gap(20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primarycolor,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 40),
                        child: Column(
                          children: [
                            const Gap(20),
                  CustomTxtfield(
                    hint: 'Email',
                    ispassword: false,
                    controller: emailcontroller,
                  ),
                  const Gap(30),
                  CustomTxtfield(
                    hint: 'Password',
                    ispassword: true,
                    controller: passcontroller,
                  ),
                  const Gap(50),
                  CustomAuthBtn(
                    text: 'Log in',
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        login();
                      }
                    },
                  )
                        ],
                      ),
                  )),)
                ],
              ),
            ),
          ),
        ),
    );
  }
}