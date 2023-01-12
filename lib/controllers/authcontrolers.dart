import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dmapp/widget/feedback.dart';
import 'package:get/get.dart';
import 'package:dmapp/screenz/auth/SIGNINSCREEN.dart';
import 'package:dmapp/screenz/auth/SIGNUPSCREEN.dart';
import 'package:flutter/foundation.dart';
import 'package:dmapp/utilities/firebase_services.dart';

import '../screenz/home/home_screen.dart';

class Authcontroller extends GetxController {
  late FirebaseAuth _auth;
  final user = Rxn<User>();
  late Stream<User?> authstatechanges;

  @override
  void onReady() {
    initializer();
    super.onReady();
  }

  Future<void> initializer() async {
    _auth = FirebaseAuth.instance;
    authstatechanges = _auth.authStateChanges();
    //checckimg if the current user exists or is registered
    authstatechanges.listen((User? currentuser) {
      user.value = currentuser;
    });
  }

  bool validateSignIn(String email, String pswd) {
    if (email.isEmpty) {
      UserFeedBack.showErrorSnackBar('Email is empty');
      return false;
    } else if (!(email.contains('@') && email.contains('.com'))) {
      UserFeedBack.showErrorSnackBar('Invalid Email');
      return false;
    } else if (pswd.isEmpty) {
      UserFeedBack.showErrorSnackBar(
          'Password field is empty, please supply the password');
      return false;
    } else if (pswd.length < 8) {
      UserFeedBack.showErrorSnackBar('Password must be atleast 8 characters');
      return false;
    } else {
      print("Returned True");
      return true;
    }
  }

  bool validateSignUp(
      String email, String pswd, String pswd2, String username) {
    if (email.isEmpty) {
      UserFeedBack.showErrorSnackBar('Email is empty');
      return false;
    } else if (!(email.contains('@') && email.contains('.com'))) {
      UserFeedBack.showErrorSnackBar('Invalid Email');
      return false;
    } else if (username.isEmpty) {
      UserFeedBack.showErrorSnackBar('Username field is empty');
      return false;
    } else if (username.length > 15) {
      UserFeedBack.showErrorSnackBar(
          'Your username should not exceed 15 characters');
      return false;
    } else if (pswd.isEmpty) {
      UserFeedBack.showErrorSnackBar(
          'Password field is empty, please supply the password');
      return false;
    } else if (pswd.length < 8) {
      UserFeedBack.showErrorSnackBar('Password must be atleast 8 characters');
      return false;
    } else if (!(pswd == pswd2)) {
      UserFeedBack.showErrorSnackBar(
          'Password mismatch. Confirm your password !');
      return false;
    } else {
      print("Returned True");
      return true;
    }
  }

  Future<void> registerUser(
      String suppliedEmail, String suppliedPassword, String uName) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: suppliedEmail, password: suppliedPassword);
      await userReference.doc(suppliedEmail.toLowerCase()).set({
        'email': suppliedEmail.toLowerCase(),
        'username': uName,
        'image': '',
        'date_registered': DateTime.now()
      });
      // if successful

      UserFeedBack.showSuccessSnackBar(
          'Dear ${uName.toUpperCase()}, you have been registered successfully');
      goToLoginScreen();
    } on FirebaseAuthException catch (e) {
      UserFeedBack.showErrorSnackBar(e.message!);
    }
  }
  // A function which logs in a user in our app (with email & password)

  Future<void> loginUser(String suppliedEmail, String suppliedPassword) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: suppliedEmail, password: suppliedPassword);

      // if successful
      UserFeedBack.showSuccessSnackBar('Login Successful !');

      goToHomeScreen();
    } on FirebaseAuthException catch (e) {
      UserFeedBack.showErrorSnackBar(e.message!);
    }
  }

  // A function which logs out a user
  Future<void> logoutUser() async {
    try {
      await _auth.signOut();
      UserFeedBack.showSuccessSnackBar('Logout successful !');
      goToLoginScreen();
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  // A function which navigates the user to the login screen
  void goToLoginScreen() {
    Get.offAllNamed(Signinscreen.route);
  }

  // A function which navigates the user to the home screen
  void goToHomeScreen() {
    Get.offAllNamed(Homescreen.route);
  }

  // A function that returns the details of the currently loggedIn user
  User? currentUserDetails() {
    user.value = _auth.currentUser;
    return user.value;
  }

  // A function which checks if a user is loggedIn or not
  bool isUserLoggedIn() {
    return _auth.currentUser != null;
  }
}
