import 'package:flutter/material.dart';
import 'package:food_delivery/pages/Register.dart';
import 'package:food_delivery/pages/login.dart';
class LoginOrRegister extends StatefulWidget {
   LoginOrRegister({super.key});
  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}
class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showloginpage=true;
  void togglePages(){
   setState(() {
     showloginpage=!showloginpage;
   });
  }
  @override
  Widget build(BuildContext context) {
    if(showloginpage) {
      return LoginPage(onTap: togglePages);
    }
    else{
      return RegisterPage(onTap: togglePages);
    }
  }
}
