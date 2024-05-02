import 'package:flutter/material.dart';

import 'package:food_delivery/components/drawer_tile.dart';
import 'package:food_delivery/pages/settings.dart';
import 'package:food_delivery/services/auth/auth_services.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onTap;
     MyDrawer({super.key,this.onTap});
     void logout() {
       final _authServices=AuthServices();
       _authServices.signOut();
     }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:70),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
    DrawerTile(text: " H O M E ", icon: Icons.home,onTap: (){
      Navigator.pop(context);
    },),
          DrawerTile(text: " S E T T I N G S  ", icon: Icons.settings,onTap: (){
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
          },),
          Spacer(),
          DrawerTile(text: " L O G O U T   ", icon: Icons.settings,onTap: logout,),
        ],
      ),
    );
  }
}
