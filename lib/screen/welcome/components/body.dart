import 'package:flutter/material.dart';
import 'package:shop_app_example/constants.dart';
import 'package:shop_app_example/screen/login/login_screen.dart';
import 'package:shop_app_example/screen/signup/signup_screen.dart';

import 'bg.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "WELCOME",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            Image.asset(
              "assets/images/logo.png",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              padding:  EdgeInsets.symmetric(horizontal: size.width*0.07),
              child: ElevatedButton(
                  child: const SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "LOGIN",
                        style:
                            TextStyle(fontSize: 23, color: kPrimaryLightColor),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    )),
                    backgroundColor: MaterialStateProperty.all(kPrimaryColor)
                  )),
            ),
            Container(
              padding:  EdgeInsets.symmetric(horizontal: size.width*0.07),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                child: const SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(fontSize: 23, color: kPrimaryColor),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    )),
                    backgroundColor:
                        MaterialStateProperty.all(kPrimaryLightColor)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
