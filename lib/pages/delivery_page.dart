import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/resturant.dart';
import 'package:food_delivery/pages/receipt.dart';
import 'package:food_delivery/services/databases/firestore.dart';
import 'package:provider/provider.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  Friestoree db=Friestoree();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String receipt=context.read<Resturant>().displaycartreciept();
    db.saveOrderToDatabase(receipt);
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Delivery Page"),
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: buildButtomNavigationBar(context),
    body: Column(
      children: [
        MyReceipt()
      ],
    ),
    );
  }
}

Widget buildButtomNavigationBar(BuildContext context) {
  return Container(
    height: 100,
    decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40))),
    padding: EdgeInsets.all(25),
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: BoxShape.circle),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mitch KOKO',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            Text(
              'Delivery',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: Theme.of(context).colorScheme.primary),
            )
          ],
        ),
        Spacer(),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle
              ),
              child: IconButton(
                onPressed: (){},
                icon: Icon(Icons.call),color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(width: 10,),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  shape: BoxShape.circle
              ),
              child: IconButton(
                onPressed: (){},
                icon: Icon(Icons.message),
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ],
    ),

  );

}
