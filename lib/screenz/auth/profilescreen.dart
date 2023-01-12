import 'package:dmapp/controllers/authcontrolers.dart';
import 'package:dmapp/widget/ICONROWWIDGET.dart';
import 'package:dmapp/widget/textnumwidget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  Authcontroller authController = Get.find<Authcontroller>();
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width.round();
    var h = MediaQuery.of(context).size.height.round();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.03),
          child: Column(
            children: [
              SizedBox(height: h * 0.06),
              Container(
                child: Row(
                  children: [
//theimage
                    CircleAvatar(
                      foregroundImage: AssetImage('asset/generalimg1.png'),
                      radius: h * 0.07,
                    ),
                    SizedBox(width: w * 0.05),
//theusername&email
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TheAlphanumeric',
                          style: TextStyle(
                            fontSize: h * 0.03,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: h * 0.018),
                        Container(
                          width: w * 0.5,
                          child: Text(
                            'yourRealemailHere@gmail.com',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: h * 0.019,
//fontWeight:FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: w * 0.05, vertical: h * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextNumWidget(number: '826', text: 'Followers'),
                    TextNumWidget(number: '251', text: 'Following'),
                    TextNumWidget(number: '81K', text: 'NewsRead'),
                  ],
                ),
              ),
              SizedBox(
                height: 0.0293,
              ),
              Divider(
                thickness: h * 0.00022,
                color: Colors.black,
              ),
              SizedBox(
                height: 0.0293,
              ),
              IconRow(
                iwantswitch: true,
                iconz: Icons.lightbulb_outlined,
                textz: 'Night',
              ),
              SizedBox(
                height: 0.0293,
              ),
              IconRow(
                iwantswitch: true,
                iconz: Icons.notifications,
                textz: 'Notification',
              ),
              SizedBox(
                height: 0.0293,
              ),
              IconRow(
                iwantswitch: true,
                iconz: Icons.share,
                textz: 'Social Media',
              ),
              SizedBox(
                height: 0.0293,
              ),
              Divider(
                thickness: h * 0.00022,
                color: Colors.black,
              ),
              InkWell(
                onTap: () {
                  authController.logoutUser();
                },
                child: IconRow(
                  iwantswitch: false,
                  iconz: Icons.logout_rounded,
                  textz: 'Logout',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
