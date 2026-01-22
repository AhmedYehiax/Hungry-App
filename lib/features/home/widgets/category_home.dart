import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';

class CategoryHome extends StatefulWidget {
  const CategoryHome({super.key, required this.category, required this.selectedCategory});
  final int selectedCategory;
  final List category;

  @override
  State<CategoryHome> createState() => _CategoryHomeState();
}

class _CategoryHomeState extends State<CategoryHome> {
  late int selectedCategory;

  @override
  void initState() {
    selectedCategory = widget.selectedCategory ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:List.generate(widget.category.length, (index){
          return GestureDetector(
            onTap: (){
              setState(() {
              selectedCategory = index ;
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                  color: selectedCategory == index ? AppColors.primarycolor : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15)
              ),
              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27.0,vertical: 15),
                child: Text(
                  widget.category[index],
                  style: TextStyle(
                      color: selectedCategory == index ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
