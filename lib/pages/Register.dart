import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home.dart';
import 'package:food_delivery/pages/login.dart';
import 'package:food_delivery/services/auth/auth_services.dart';

import '../components/buttons.dart';
import '../components/textfield.dart';
class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key,required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  final TextEditingController confirmController=TextEditingController();
  void Register() async{
    final _authServices=AuthServices();
    if(passwordController.text==confirmController.text) {
      try{
      await  _authServices
            .signupWithEmailAndPassword(emailController.text,
          passwordController.text);
Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
      }
      catch(e){
        showDialog(context: context, builder: (context)=>
AlertDialog(
  title: Text(e.toString()),
)
        );
      }
    }
    else {
      showDialog(context: context, builder: (context)=>
          AlertDialog(
            title: Text("password doesn't match!")
          )
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lock_open_rounded,size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            SizedBox(height: 25,),
            Text("Let's Create an Account",style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),),
            SizedBox(height: 25,),
            MyTextField(
              controller: emailController,
              hintText: "Email ",
              obscureText: false,
            ),
            SizedBox(height: 10,),
            MyTextField(
              controller: passwordController,
              hintText: "Password ",
              obscureText: true,
            ),

            SizedBox(height: 10,),
            MyTextField(
              controller: confirmController,
              hintText: "confirm password ",
              obscureText: true,
            ),
            SizedBox(height: 25,),
            MyButtons(onTap: Register, text: "Sign Up"),
            SizedBox(height: 25,),
            Row(
              children: [
                Text("Already Have An Account?",style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary
                ),),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Login",style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold
                  ),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
