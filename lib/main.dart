import 'package:dmapp/appbinding.dart';
import 'package:dmapp/firebase_options.dart';
import 'package:dmapp/screenz/auth/profilescreen.dart';

import 'package:dmapp/utilities/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:dmapp/screenz/intro/onboardingscreen.dart';

import 'package:dmapp/screenz/home/home_screen.dart';
import 'package:dmapp/screenz/auth/SIGNINSCREEN.dart';
import 'package:dmapp/screenz/auth/SIGNUPSCREEN.dart';
import 'package:dmapp/screenz/news/general/generalnewslist.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'screenz/home/home_screen.dart';

import './screenz/auth/SIGNINSCREEN.dart';
import './screenz/auth/SIGNUPSCREEN.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppBindings().dependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(newapp());
}

class newapp extends StatelessWidget {
  const newapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dmapp',
      getPages: Routes.routez,
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}
