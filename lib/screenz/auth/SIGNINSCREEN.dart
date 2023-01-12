import 'package:dmapp/screenz/auth/SIGNUPSCREEN.dart';
import 'package:dmapp/utilities/myappcolor.dart';
import 'package:flutter/material.dart';
import 'package:dmapp/widget/our_button.dart';
import 'package:get/get.dart';
import 'package:dmapp/widget/feedback.dart';
import 'package:dmapp/controllers/authcontrolers.dart';
import 'package:dmapp/screenz/home/home_screen.dart';

class Signinscreen extends StatelessWidget {
  static String route = '/signin';
  Authcontroller authController = Get.find<Authcontroller>();
  TextEditingController emailcontrollerz = TextEditingController();
  TextEditingController pswordcontrollerz = TextEditingController();

  Signinscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width.round();
    var h = MediaQuery.of(context).size.height.round();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.asset('asset/2691814402-removebg.png'),
              height: h * .4,
              width: w.toDouble(),
              decoration: BoxDecoration(
                  color: MyAppColors.maincolor,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(h * 0.16)),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        MyAppColors.maincolor,
                        MyAppColors.maincolorlight
                      ])),
            ),
            SizedBox(
              height: h * 0.1,
            ),
            Column(
              children: [
                Form(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: h * 0.03),
                    child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular((h * 0.05)),
                      child: TextFormField(
                        controller: emailcontrollerz,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            iconColor: MyAppColors.maincolor,
                            icon: Icon(
                              Icons.email,
                              color: MyAppColors.maincolor,
                            ),
                            border: InputBorder.none),
                        autocorrect: true,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: h * 0.03,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: h * 0.03),
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular((h * 0.05)),
                    child: TextFormField(
                      controller: pswordcontrollerz,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        iconColor: MyAppColors.maincolor,
                        icon: Icon(
                          Icons.lock,
                          color: MyAppColors.maincolor,
                        ),
                        border: InputBorder.none,
                      ),
                      autocorrect: true,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: h * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(),
                TextButton(
                  style: ButtonStyle(alignment: Alignment.topRight),
                  onPressed: () {},
                  child: Text('Forgot Password?',
                      style: TextStyle(color: MyAppColors.maincolor)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(),
                TextButton(
                  style: ButtonStyle(alignment: Alignment.topRight),
                  onPressed: () {
                    Get.toNamed(SignUpScreen.route);
                  },
                  child: Text('Dont have an account?',
                      style: TextStyle(color: MyAppColors.maincolor)),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.03,
            ),
            Container(
              height: h * 0.06,
              width: w - 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(h * 0.16),
                    top: Radius.circular(h * 0.16)),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      MyAppColors.maincolorlight,
                      MyAppColors.maincolor
                    ]),
                color: MyAppColors.maincolor,
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    String email = emailcontrollerz.text.trim();
                    String pswd = pswordcontrollerz.text.trim();
                    print('user emaill${emailcontrollerz.text}');
                    print('user password${pswordcontrollerz.text}');
                    if (authController.validateSignIn(email, pswd)) {
                      UserFeedBack.showSuccessSnackBar('Success!');
                    }
                  },
                  child: OurButton(
                    text: 'LOGIN',
                    height: h * 0.08,
                    width: w - 100,
                    radius: h * 0.05,
                    fontSize: h * 0.03,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
