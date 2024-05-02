import 'package:flutter/material.dart';
import 'package:food_delivery/pages/cartpage.dart';

class Sliver_app extends StatelessWidget {
  final Widget child;
  final Widget title;
   Sliver_app({super.key,required this.title,required this.child});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text("Sunset dinner"),
      floating: false,
      pinned: true,
      actions: [
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
        }, icon: Icon(Icons.shopping_cart)),

      ],

      collapsedHeight: 120,
      expandedHeight: 340,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: EdgeInsets.only(left: 0,right: 0,top: 0),
        expandedTitleScale: 1,
      ),

    );
  }
}
