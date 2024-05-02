import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/resturant.dart';
import 'package:provider/provider.dart';
class CurrentLocation extends StatelessWidget {
  const CurrentLocation({super.key});
void openlocation(BuildContext context) {
  final TextEditingController textcontroller = TextEditingController();
showDialog(context: context, builder: (context)=>AlertDialog(
  title: Text("your location"),
  content: TextField(
    decoration: InputDecoration(
      hintText: "Enter your location"
    ),

  ),
  actions: [
    MaterialButton(onPressed: (){

      Navigator.pop(context);
      textcontroller.clear();
    },
      child: Text("Cancel"),
    ),
    MaterialButton(onPressed: (){
      String newAddress=textcontroller.text;
      context.read<Resturant>().updateDeliveryAdress(newAddress);
      Navigator.pop(context);
      textcontroller.clear();

    },
      child: Text("Save"),
    ),
  ],
));
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Deliver Now",style: TextStyle(
              color: Theme.of(context).colorScheme.primary
          ),),

          GestureDetector(
            onTap: ()=>openlocation(context),
            child: Row(
              children: [
            Consumer<Resturant>(builder:(context,Resturant,child) =>
                Text(Resturant.DeliveryAdress,
              style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,fontWeight: FontWeight.bold),)),
                Icon(Icons.keyboard_arrow_down_rounded)
              ],
            ),
          )
        ],
      ),
    );

  }
}
