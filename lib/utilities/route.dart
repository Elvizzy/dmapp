import 'package:dmapp/screenz/auth/SIGNINSCREEN.dart';
import 'package:dmapp/screenz/auth/SIGNUPSCREEN.dart';
import 'package:dmapp/screenz/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:dmapp/screenz/home/home_screen.dart';

class Routes {
  //list of our pages
  static List<GetPage> routez = [
    GetPage(name: '/home', page: () => Homescreen()),
    GetPage(name: '/signup', page: () => SignUpScreen()),
    GetPage(name: '/signin', page: () => Signinscreen())
  ];
}
