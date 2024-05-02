import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyButtons extends StatelessWidget {
final Function()? onTap;
final String text;
const MyButtons(
{
  super.key,
  required this.onTap,
  required this.text,
}
    );
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color:Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(25)
        ),
        child: Center(
          child: Text(text,style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.inversePrimary,
            fontSize: 16
          ),),
        ),
      ),
    );
  }
}
