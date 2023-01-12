import 'package:dmapp/screenz/auth/SIGNINSCREEN.dart';
import 'package:dmapp/utilities/myappcolor.dart';
import 'package:dmapp/widget/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dmapp/controllers/authcontrolers.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  static String route = '/signup';

  Authcontroller authController = Get.find<Authcontroller>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width.round();
    var h = MediaQuery.of(context).size.height.round();

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: 0.05,
                  child: ShaderMask(
                      child: Image(
                        image: AssetImage(
                          'asset/2691814402-removebg.png',
                        ),
                      ),
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(colors: [
                          Colors.black,
                          MyAppColors.maincolorlight,
                        ]).createShader(bounds);
                      }),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 90),
              child: Column(
                children: [
                  ShaderMask(
                      child: Image.asset(
                        'asset/2691814402-removebg.png',
                        width: w * 0.29,
                      ),
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(colors: [
                          MyAppColors.maincolor,
                          MyAppColors.maincolorlight,
                        ]).createShader(bounds);
                      }),
                  SizedBox(
                    height: h * 0.07,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: h * 0.03),
                    child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(h * 0.05),
                      shadowColor: Colors.black,
                      child: TextField(
                        controller: emailController,
                        autocorrect: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(h * 0.023),
                          prefixIcon: Icon(
                            Icons.email,
                            color: MyAppColors.maincolor,
                          ),
                          hintText: 'Email',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: h * 0.03),
                    child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(h * 0.05),
                      shadowColor: Colors.black,
                      child: TextField(
                        controller: usernameController,
                        autocorrect: true,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(h * 0.023),
                          prefixIcon: Icon(
                            Icons.person,
                            color: MyAppColors.maincolor,
                          ),
                          hintText: 'Username',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: h * 0.03),
                    child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(h * 0.05),
                      shadowColor: Colors.black,
                      child: TextField(
                        controller: passwordController,
                        autocorrect: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(h * 0.023),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: MyAppColors.maincolor,
                          ),
                          hintText: 'Password',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: h * 0.03),
                    child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(h * 0.05),
                      shadowColor: Colors.black,
                      child: TextField(
                        controller: confirmPasswordController,
                        autocorrect: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(h * 0.023),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: MyAppColors.maincolor,
                          ),
                          hintText: 'Confirm Password',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.06,
                  ),
                  //Sign Up Button
                  GestureDetector(
                    onTap: () {
                      var email = emailController.text.trim();
                      var pswd = passwordController.text.trim();
                      var pswd2 = confirmPasswordController.text.trim();
                      var username = usernameController.text.trim();

                      if (authController.validateSignUp(
                          email, pswd, pswd2, username)) {
                        authController.registerUser(email, pswd, username);
                      }
                    },
                    child: OurButton(
                      text: 'SignUp',
                      height: h * 0.08,
                      width: w - 100,
                      radius: h * 0.05,
                      fontSize: h * 0.03,
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an Account?",
                        style: TextStyle(fontSize: h * 0.02),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Signinscreen.route);
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: MyAppColors.maincolor,
                              fontWeight: FontWeight.bold,
                              fontSize: h * 0.02),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: h * 0.03),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
