import 'package:dmapp/screenz/auth/profilescreen.dart';
import 'package:dmapp/screenz/news/Art/artnewslist.dart';
import 'package:dmapp/screenz/news/Economy/economynewslist.dart';
import 'package:dmapp/screenz/news/Fun/funnewslist.dart';
import 'package:dmapp/screenz/news/Health/healthnewslist.dart';
import 'package:dmapp/screenz/news/Music/musicnewslist.dart';
import 'package:dmapp/screenz/news/Science/sciencenewslist.dart';
import 'package:dmapp/screenz/news/Sport/sportnewslist.dart';
import 'package:dmapp/screenz/news/Tech/technewslist.dart';

import 'package:dmapp/utilities/myappcolor.dart';
import 'package:get/get.dart';
import 'package:dmapp/screenz/news/general/generalnewslist.dart';
import 'package:dmapp/utilities/data.dart';
import '/main.dart';

import 'package:dmapp/main.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:get/get.dart';

class Homescreen extends StatelessWidget {
  Homescreen({Key? key}) : super(key: key);
  static String route = '/home';

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width.round();
    var h = MediaQuery.of(context).size.height.round();
    print("OUR SCREEN: ($w , $h)");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "News Category",
          style: TextStyle(
            color: MyAppColors.maincolor,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1.0,
        actions: [
          IconButton(
            color: MyAppColors.maincolor,
            onPressed: () {
              Get.to(ProfileScreen());
            },
            icon: Icon(
              Icons.person,
              color: MyAppColors.maingreycolor,
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: h * 0.01, vertical: h * 0.08),
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          crossAxisSpacing: h * 0.006,
          mainAxisSpacing: h * 0.0075,
          childAspectRatio: h / h * 0.6,
          children: List.generate(homeData.length, (index) {
            return InkWell(
              onTap: () {
                if (index == 0) {
                  Get.to(Technewslistscreen());
                  // add screen
                } else if (index == 1) {
                  Get.to(Economynewslistscreen());

                  // add screen
                } else if (index == 2) {
                  Get.to(Sportnewslistscreen());

                  //add screen
                } else if (index == 3) {
                  Get.to(Healthnewslistscreen());

                  //add screen
                } else if (index == 4) {
                  Get.to(Artnewslistscreen());

                  //add screen
                } else if (index == 5) {
                  Get.to(Funnewslistscreen());

                  //add screen
                } else if (index == 6) {
                  Get.to(Sciencenewslistscreen());
                } else if (index == 7) {
                  Get.to(Generalnewslistscreen());

                  //add screen
                } else if (index == 8) {
                  Get.to(Musicnewslistscreen());
                }
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.35), BlendMode.darken),
                    image: AssetImage(homeData[index]['photo']),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Text(
                  homeData[index]['title'],
                  style: TextStyle(
                    fontSize: h * 0.035,
                    fontWeight: FontWeight.bold,
                    color: MyAppColors.appwhite,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
