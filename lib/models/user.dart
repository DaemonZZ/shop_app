import 'package:flutter/cupertino.dart';

class User with ChangeNotifier {
  int id = 0;
  String userName = "";
  String password = "";
  String name = "";
  String address = "";
  String phone = "";

  User(this.id,this.userName, this.password, this.name, this.address, this.phone);
  User.init();

  User.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    password = json['password'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['password'] = password;
    data['name'] = name;
    data['address'] = address;
    data['phone'] = phone;
    return data;
  }
}
