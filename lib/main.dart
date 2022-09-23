import 'package:dmapp/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import './screens/home_screen.dart';
import 'dart:ui';

void main() {
  runApp(newapp());
}

class newapp extends StatelessWidget {
  const newapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Taskmanager(),
    );
  }
}
