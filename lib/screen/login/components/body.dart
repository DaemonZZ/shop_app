import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_example/bloc/user_bloc.dart';
import 'package:shop_app_example/event/user_event/user_login_event.dart';
import 'package:shop_app_example/screen/home/home_screen.dart';
import 'package:shop_app_example/screen/signup/signup_screen.dart';
import 'package:shop_app_example/screen/welcome/components/bg.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController userController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              top: size.height * 0.2, bottom: size.height * 0.1),
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Welcome,",
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline1
                    ),
                    Text(
                        "Login to continue!",
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline2
                    ),
                  ],
                ),
              ),


              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: size
                        .width * 0.07),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: kPrimaryLightColor
                    ),
                    child: Center(
                      child: TextField(
                        controller: userController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: "User Name",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: size
                        .width * 0.07),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: kPrimaryLightColor
                    ),
                    child: Center(
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            labelText: "Password",
                            border: InputBorder.none,
                            suffixIcon: IconButton(onPressed: () {
                              print("ok");
                            }, icon: const Icon(Icons.remove_red_eye))
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: size.width *
                        0.07),
                    margin: const EdgeInsets.only(top: 10),
                    child: Consumer<UserBloc>(
                      builder: (ctx, bloc, child) {
                        return ElevatedButton(
                          child: const SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 23, color: kPrimaryLightColor),
                              ),
                            ),
                          ),
                          onPressed: () {
                            bloc.event.add(UserLoginEvent(userController.text, passwordController.text,context));
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  )),
                              backgroundColor: MaterialStateProperty.all(
                                  kPrimaryColor)),
                        );
                      },
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(onPressed: () {},
                        child: const Text("Forgot password",
                          style: TextStyle(color: kTextColor),),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.transparent),
                            elevation: MaterialStateProperty.all(0)
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const SignUpScreen();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          "New User?", style: TextStyle(color: kTextColor),),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.transparent),
                            elevation: MaterialStateProperty.all(0)
                        ),
                      )
                    ],
                  )
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
