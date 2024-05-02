import 'package:flutter/material.dart';
import 'package:food_delivery/models/food.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;
   MyTabBar({super.key,required this.tabController});
List<Tab> buildcategory(){
  return foodCategories.values.map((category) {
return Tab(
text: category.toString().split('.').last,

);
  }).toList();
}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        tabs:buildcategory(),
      ),
    );
  }
}
