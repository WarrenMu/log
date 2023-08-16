import 'package:flutter/material.dart';
import 'package:log/services/auth/auth_services.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //sign user out
  void signout(){
  final authService = Provider.of<AuthService>(context, listen: false);
  authService.signOut();
  }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          //signout button
          IconButton(onPressed: signout, icon: const Icon(Icons.logout),)
        ],
      ),
    );
  }
}