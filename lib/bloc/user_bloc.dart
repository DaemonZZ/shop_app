import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_example/base/base_bloc.dart';
import 'package:shop_app_example/base/base_event.dart';
import 'package:shop_app_example/datasource/network/api.dart';
import 'package:shop_app_example/event/user_event/user_login_event.dart';
import 'package:shop_app_example/models/session.dart';
import 'package:shop_app_example/models/user.dart';
import 'package:shop_app_example/screen/home/home_screen.dart';

class UserBloc extends BaseBloc{
  StreamController<User> _streamController = StreamController<User>();
  Stream<User> get stream => _streamController.stream;

  Future authenResult(String userName, String password,BuildContext context)async{
    User? rs = await ApiRequest.checkAuthen(userName, password);
    if(rs!=null){
      Session.currentUser = rs;

      Navigator.push(context,MaterialPageRoute(builder: (context){
        return const HomeScreen();
      }));

      _streamController.sink.add(rs);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Wrong name or password! Try again'),
      ),
    );
  }

  @override
  dispatchEvent(BaseEvent event) {
    if(event is UserLoginEvent && event.context!=null){
      authenResult(event.userName, event.passWord,event.context!);
    } else {
      throw Exception("Invalid");
    }
  }

}