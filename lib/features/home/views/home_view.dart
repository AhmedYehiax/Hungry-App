import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/home/widgets/card_Item.dart';
import '../../product/views/product_details_view.dart';
import '../widgets/category_home.dart';
import '../widgets/search_field.dart';
import '../widgets/user_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List category = [
    'All',
    'Combo',
    'Sliders',
    'Classic',
  ];
  int selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Gap(50),
                        UserHeader(),
                        Gap(30),
                        SearchField(),
                        Gap(25),
                        CategoryHome(category: category, selectedCategory: selectedCategory,),
                        Gap(20)
                      ],
                    ),
                  )
              )
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              sliver: SliverGrid(
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.67,
                ),
                  delegate: SliverChildBuilderDelegate(
                      childCount: 6,
                          (context , index){
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (c){
                                return ProductDetailsView();
                              }
                              )
                              );
                            },
                            child: CardItem(
                                  image:'assets/home/item-1.jpg',
                                  name: 'Cheeseburger',
                                  decs: "Wendy's Burger",
                                  rate: '4.6'),
                          );
                      }
                    ),
              )
            )
          ]
        )
      )
      );
  }
}
