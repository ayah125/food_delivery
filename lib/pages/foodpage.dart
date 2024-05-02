import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/components/buttons.dart';
import 'package:food_delivery/models/food.dart';
import 'package:food_delivery/models/resturant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon,bool> selectedAddons={};
   FoodPage({super.key,required this.food}){
     for(Addon addon in food.availableAdon){
       selectedAddons[addon]=false;
     }
   }
  @override
  State<FoodPage> createState() => _FoodPageState();
}
class _FoodPageState extends State<FoodPage> {
void addToCart(Food food,Map<Addon,bool> selectedAddons) {
  Navigator.pop(context);
  List<Addon > currentSelectedAddons=[];
  for(Addon addon in widget.food.availableAdon){
if(widget.selectedAddons[addon]==true) {
  currentSelectedAddons.add(addon);
}
  }
  context.read<Resturant>().addToCart(food, currentSelectedAddons);
}
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //scaffold ui
    Scaffold(
    body:
    SingleChildScrollView(
    child: Column(
    children: [
      //image
    Image.asset(widget.food.imagepath,),
    Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(widget.food.name,style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20
    ),),
    SizedBox(height: 10,),
    Text("\$" + widget.food.price.toString(),style: TextStyle(
    color: Theme.of(context).colorScheme.primary,
    fontSize: 16
    ),),
    SizedBox(height: 10,),
    Divider( color: Theme.of(context).colorScheme.secondary,),
    Text(widget.food.description,style: TextStyle(
    color: Theme.of(context).colorScheme.primary,
    fontSize: 16
    ),),
    SizedBox(height: 10,),
    Divider(
    color: Theme.of(context).colorScheme.secondary,
    ),
    Text("Add-ones",style: TextStyle(
    color: Theme.of(context).colorScheme.inversePrimary,
    fontSize: 16,
    fontWeight: FontWeight.bold
    ),),
    Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    border: Border.all(
    color: Theme.of(context).colorScheme.secondary,

    )
    ),
    child: ListView.builder(itemBuilder:(context,index){
    Addon adon=widget.food.availableAdon[index];
    return CheckboxListTile(
    title: Text(adon.name),
    subtitle: Text("\$" + adon.price.toString(),style: TextStyle(
    color: Theme.of(context).colorScheme.primary
    ),),
    value: widget.selectedAddons[adon], onChanged:
    (bool?value){
    setState(() {
    widget.selectedAddons[adon]=value!;
    });
    });
    },
    itemCount: widget.food.availableAdon.length,
    shrinkWrap: true,
    padding: EdgeInsets.zero,
    physics: NeverScrollableScrollPhysics(),

    ),
    )
    ],
    ),
    ),
    MyButtons(onTap: () =>
        addToCart(widget.food,widget.selectedAddons), text: "Add To cart"),
    SizedBox(height: 25,),
    ],
    ),
    )
    ),
        SafeArea(child: Opacity(
          opacity: 0.5,
          child: Container(
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(

              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.secondary
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_outlined),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ),
        ))
      ],
    );
  }
}
