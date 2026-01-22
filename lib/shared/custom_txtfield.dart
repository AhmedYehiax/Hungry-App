import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry/core/constant/app_colors.dart';

class CustomTxtfield extends StatefulWidget {
  const CustomTxtfield({super.key, required this.hint, required this.ispassword, required this.controller});
  final String hint;
  final bool ispassword;
  final TextEditingController controller;

  @override
  State<CustomTxtfield> createState() => _CustomTxtfieldState();
}

class _CustomTxtfieldState extends State<CustomTxtfield> {
  late bool _obscuretxt;

  @override
  void initState() {
   _obscuretxt = widget.ispassword ;
    super.initState();
  }
  void _togglePassword(){
    setState(() {
      _obscuretxt =  !_obscuretxt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscuretxt,
      cursorHeight: 20,
      cursorColor: AppColors.primarycolor,
      validator: (v) {
        if(v == null || v.isEmpty){
          return 'Please fill ${widget.hint}';
        }
        return null;
      },
      decoration: InputDecoration(
        suffix: widget.ispassword ? GestureDetector(
            onTap: _togglePassword,
            child: Icon(CupertinoIcons.eye)):null,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white,width: 1),
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white,width: 1),
          ),
          hintText: widget.hint,
          fillColor: Colors.white,
          filled: true,
      ),
    );
  }
}
