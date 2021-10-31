import 'package:flutter/cupertino.dart';
import 'package:shop_app_example/base/base_event.dart';

class UserLoginEvent extends BaseEvent{
  String userName = "";
  String passWord = "";
  BuildContext? context;
  UserLoginEvent(this.userName,this.passWord,this.context);
}