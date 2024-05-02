import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/components/buttons.dart';
import 'package:food_delivery/components/textfield.dart';
import 'package:food_delivery/pages/home.dart';
import 'package:food_delivery/services/auth/auth_services.dart';
class LoginPage extends StatefulWidget {
  final Function()? onTap;
  LoginPage({super.key, this.onTap});
  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void Login() async {
    final _authServices = AuthServices();

    try {
      await _authServices.signInWithEmailAndPassword(emailController.text,
          passwordController.text);

    }
    catch (e) {
      showDialog(context: context, builder: (context) =>
          AlertDialog(
            title: Text(e.toString()),
          )
      );
    }
  }
  void forgotps() async {
    showDialog(context: context, builder: (context) =>
        AlertDialog(
          title: Text('user tapped forgot password  '),
        )
    );
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock_open_rounded, size: 100,
                color: Theme
                    .of(context)
                    .colorScheme
                    .inversePrimary,
              ),
              SizedBox(height: 25,),
              Text('Food Delivery App', style: TextStyle(
                fontSize: 16,
                color: Theme
                    .of(context)
                    .colorScheme
                    .inversePrimary,

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
              SizedBox(height: 25,),
              MyButtons(onTap: Login,
                  text: "Login"),
              SizedBox(height: 25,),
              Row(
                children: [
                  Text("Not a member?", style: TextStyle(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .inversePrimary
                  ),),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text("Register Now", style: TextStyle(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .inversePrimary,
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

