import 'package:flutter/material.dart';
import 'package:food_delivery/models/food.dart';

class QuantitySelector extends StatelessWidget {
 final int quantity;
 final Food food;
 final VoidCallback onInrement;
 final VoidCallback ondecrement;

   QuantitySelector({super.key,required this.food,required this.quantity,
     required this.ondecrement,required this.onInrement});


  @override
  Widget build(BuildContext context) {
    return Container(
decoration: BoxDecoration(
  color: Theme.of(context).colorScheme.background,
  borderRadius: BorderRadius.circular(50)
),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
GestureDetector(
  onTap: ondecrement,
  child: Icon(Icons.remove,size: 20,color: Theme.of(context).colorScheme.primary),
),
          Padding(padding: EdgeInsets.symmetric(horizontal: 8),
          child: SizedBox(width:20,
              child: Center(child: Text(quantity.toString()),)),),
          GestureDetector(
            onTap: onInrement,
            child: Icon(Icons.add,size: 20,
                color: Theme.of(context).colorScheme.primary),
          ),

        ],
      ),
    );
  }
}
