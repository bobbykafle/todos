// ignore_for_file: unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/authentication/auth.dart';

class AuthProvider extends ChangeNotifier{
  final Auth _auth = Auth();
  bool isLoading = false;
  String errorMessage ='';
  String emailError ='';
  String passwordError= '';
  User? user;
  bool get isLoggedIn => user != null; 


  AuthProvider(){ //Listen to the  auth changes
  _auth.authStateChanges.listen((User? newuser){
     user =newuser;
     notifyListeners();    //It tells Ui to rebuild 
  });

  } 


  //Wrap Auth Method with State Management
Future<void> signIn(String email, String password) async{
  isLoading = false;
  errorMessage = '';
  emailError = '';
  passwordError = '';
  notifyListeners();

  
  String? result = await _auth.signInWithEmailAndPassword(
    email: email, password: password);

  if(result != null) {
    if (result.toLowerCase().contains('email')){
      emailError = result;
    }else if (result.toLowerCase().contains('password')){
      passwordError = result;
    } else{
      emailError = result;
      passwordError = result;
    }
  }
  isLoading = false;
  notifyListeners();
}
 
 Future<void> signUp(String email, String password) async{
  isLoading = true;
  notifyListeners();

  String? result = await _auth.createUserWithEmailAndPassword(
    email: email, password: password);

  if(result != null) errorMessage = result;
   isLoading =false;
   notifyListeners();
 }

  Future<void> signInWithGoogle() async{
    isLoading = true;
    errorMessage = '';
    notifyListeners();

    String? result = await _auth.signInWithGoogle();

  if(result != null) errorMessage = result;
   isLoading =false;
   notifyListeners();

  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
