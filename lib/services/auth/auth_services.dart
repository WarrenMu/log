import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier{
  // instance of auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // sign user in
Future<UserCredential> signInWithEmailAndPassword(
  String email, String password) async{
     //sign in 
  try{
     UserCredential userCredential = 
     await _firebaseAuth.signInWithEmailAndPassword(
      email: email, 
      password: password,);
      return userCredential;

    // catch any errors
  } on FirebaseAuthException catch (e) {
    throw Exception(e.code);
  }
  }
  // creating a new user
  Future<UserCredential> signUpWithEmailAndPassword(
  String email, String password) async{
     //sign in 
  try{
     UserCredential userCredential = 
     await _firebaseAuth.createUserWithEmailAndPassword(
      email: email, 
      password: password);
      return userCredential;

    // catch any errors
  } on FirebaseAuthException catch (e) {
    throw Exception(e.code);
  }
  }


  // sign user out
  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }

}
   
