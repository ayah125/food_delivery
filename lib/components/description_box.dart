import 'package:flutter/material.dart';

class DescreptionBox extends StatelessWidget {
  const DescreptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    var primarytextstyle=TextStyle(
color: Theme.of(context).colorScheme.inversePrimary
    );

    var secondrytextstyle=TextStyle(
        color: Theme.of(context).colorScheme.primary
    );
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(25)
      ),
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.only(left: 25,right: 25,bottom: 25),
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
      Column(
        children: [
          Text("3.25\$",style: primarytextstyle,),
          Text('Delivery fee',style: secondrytextstyle,)
        ],
      ),
          Column(
            children: [
              Text("15-30 min",style: primarytextstyle,),
              Text('Delivery time',style: secondrytextstyle,)
            ],
          )
        ],
      ),
    );
  }
}
