import 'package:dmapp/screenz/home/listmapdata.dart';
import 'package:dmapp/utilities/myappcolor.dart';

import '/main.dart';

import 'package:dmapp/main.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Taskmanager extends StatefulWidget {
  Taskmanager({Key? key}) : super(key: key);

  @override
  State<Taskmanager> createState() => _TaskmanagerState();
}

class _TaskmanagerState extends State<Taskmanager> {
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
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: MyAppColors.maingreycolor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: h * 0.01, vertical: h * 0.06),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 5,
          childAspectRatio: h / h * 0.6,
          children: List.generate(homeData.length, (index) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
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
            );
          }),
        ),
      ),
    );
  }
}
