import 'package:flutter/material.dart';
import 'package:food_delivery/components/description_box.dart';
import 'package:food_delivery/components/drawer.dart';
import 'package:food_delivery/components/food_tile.dart';
import 'package:food_delivery/components/my_current_location.dart';
import 'package:food_delivery/components/tab_bar.dart';
import 'package:food_delivery/models/food.dart';
import 'package:food_delivery/models/resturant.dart';
import 'package:food_delivery/pages/foodpage.dart';
import 'package:provider/provider.dart';

import '../components/my_sliver_page.dart';
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Food> filteritembycategory(
      foodCategories category, List<Food> fullmenu) {
    return fullmenu.where((food) => food.category == category).toList();
  }

  List<Widget> getfoodincategory(List<Food> fullmenu) {
    return foodCategories.values.map((category) {
      List<Food> categoryMenu = filteritembycategory(category, fullmenu);
      return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: categoryMenu.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final food = categoryMenu[index];
            return FoodTile(
                food: food,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              FoodPage(food: food)));
                });
          });
    }).toList();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController =
        TabController(length: foodCategories.values.length, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                Sliver_app(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Divider(
                          endIndent: 25,
                          indent: 25,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        CurrentLocation(),
                        DescreptionBox()
                      ],
                    ),
                    title: MyTabBar(
                      tabController: _tabController,
                    )),
              ],
          body: Consumer<Resturant>(
            builder: (context, Resturant, child) => TabBarView(
                controller: _tabController,
                children: getfoodincategory(Resturant.menu)),
          )),
    );
  }
}
