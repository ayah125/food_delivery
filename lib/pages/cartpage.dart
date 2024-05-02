import 'package:food_delivery/components/buttons.dart';
import 'package:food_delivery/components/cart_tile.dart';
import 'package:food_delivery/models/resturant.dart';
import 'package:food_delivery/pages/payment_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<Resturant>
      (builder: (context,Resturant,child){
final usercart=Resturant.cart;
return Scaffold(
  appBar: AppBar(
    title: Text("Cart"),
    backgroundColor: Colors.transparent,
    foregroundColor:Theme.of(context).colorScheme.inversePrimary ,
    actions: [
      IconButton(onPressed: (){
        showDialog(context: context, builder: (context)=>AlertDialog(
          title: Text("Are you sure you want to clear this cart?"),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Cancel')),
            TextButton(onPressed: (){
              Navigator.pop(context);
              Resturant.clearcart();
            }, child: Text('Yes')),
          ],
        ),);
      },
          icon:Icon(Icons.delete),

      )
    ],
  ),
  body: Expanded(
    child: Column(
      children: [
        usercart.isEmpty?
            Expanded(child: Center(child: Text("Cart is Empty"),))
       : Expanded(child:
        ListView.builder(itemBuilder: (context,index){
          final cartItem=usercart[index];
          return CartTile(cartItem: cartItem);
        },
          itemCount: usercart.length,
        )
        ),
        MyButtons(onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentPage()));
        }, text: 'Go to checkout'),
        SizedBox(height: 25,),
      ],
      
    ),
  ),
  

);
    });
  }
}
