import 'package:flutter/material.dart';
import 'package:food_delivery/components/quantity_Selector.dart';
import 'package:food_delivery/models/cartitem.dart';
import 'package:food_delivery/models/resturant.dart';
import 'package:provider/provider.dart';
class CartTile extends StatelessWidget {
  final CartItem cartItem;
  const CartTile({super.key,required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Resturant>(builder:(context,Resturant,child)=>Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(15),

      ),
      margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(cartItem.food.imagepath,
                      height: 150,width: 150,)),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cartItem.food.name),
                    Text('\$' + cartItem.food.price.toString(),style: TextStyle(
                      color: Theme.of(context).colorScheme.primary
                    ),),
                    SizedBox(height: 10,),
                    QuantitySelector(food: cartItem.food,
                        quantity: cartItem.quantity,
                        ondecrement: (){
                          Resturant.removefromcart(cartItem);
                        },
                        onInrement: (){
                          Resturant.addToCart(cartItem.food, cartItem.selectedAddons);
                        })
                  ],
                ),


              ],
            ),
          ),
          //addons
          SizedBox(
            height: cartItem.selectedAddons.isEmpty?0:60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children:
                cartItem.selectedAddons.map((addon) => Padding(
                  padding: const EdgeInsets.only(left: 10,bottom: 10,right: 10),
                  child: FilterChip(label:
                  Row(
                    children: [
                    Text(addon.name),
                    Text(addon.price.toString())
                  ],),
                      onSelected: (value){},
                    backgroundColor: Theme.of(context).colorScheme.secondary,labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 12
                    ),),
                ),
                ).toList()

            )
          )
        ],
      ),
    )

    );
  }
}
