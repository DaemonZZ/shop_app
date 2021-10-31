import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_example/bloc/user_bloc.dart';
import 'package:shop_app_example/constants.dart';
import 'package:shop_app_example/models/session.dart';
import 'package:shop_app_example/screen/app_body.dart';

import 'bloc/session_bloc.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        FutureProvider<SessionBloc>(create: (context){
          SessionBloc().getSession();
        }, initialData: SessionBloc()),

        FutureProvider<UserBloc>(create: (context){
          SessionBloc().getSession();
        }, initialData: UserBloc()),
        ChangeNotifierProvider(create: (_)=>Session.currentUser),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            textTheme: const TextTheme(
              bodyText1: TextStyle(color: kTextColor),
              headline1: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
              headline2: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: kTextLightColor),
              headline4: TextStyle(
                color: kTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              headline3: TextStyle(
                color: kTextColor,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            primarySwatch: Colors.blue,
          ),
          home: AppBody(),
      ),
    );
  }

}





