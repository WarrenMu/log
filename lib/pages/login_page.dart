// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:log/components/my_button.dart';
import 'package:log/components/my_text_field.dart';
import 'package:log/services/auth/auth_services.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // signin user
  void signIn() async{
    //get the auth service
    final authService = Provider.of<AuthService>(
      context, listen: false);
      
      try{
        await authService.signInWithEmailAndPassword(
        emailController.text, 
        passwordController.text);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(
            e.toString(),
          ),),
        );
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SafeArea(child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50,),

              //logo
              const Icon(
                Icons.person,
                size: 80,
                color: Colors.white,
              ),
              const SizedBox(height: 50,),
              //welcome back message
              const Text("Welcome back you've been missed!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,              ),),
              const SizedBox(height: 50,),

              //email textfield
              MyTextField(
                controller: emailController, 
                hintText: 'Email', 
                obscureText: false,),
              const SizedBox(height: 50,),

              //password textfield
              MyTextField(
                controller: passwordController, 
                hintText: 'Password', 
                obscureText: true,),
              const SizedBox(height: 50,),

              //sign in button
              MyButton(text: "Sign In", onTap: signIn),

              const SizedBox(height: 50),

              // not a member? register now

               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [const Text('Not a member?',
                style: TextStyle(
                  color: Colors.white,
                ),),
                const SizedBox(width: 4,),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text('Register now',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrangeAccent
                  ),),
                )],
              )
            ],
          ), 
        ),
      )),
    );
  }
}

