import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app_example/models/product.dart';
import 'package:shop_app_example/models/user.dart';

class ApiRequest{
  static const BASE_URL = "https://my-json-server.typicode.com/DaemonZZ/fake_api_for_flutter/";
  static const URL_CART = "cart/";
  static const URL_TYPE = "type/";
  static const URL_PRODUCT = "product/";
  static const URL_ORDER = "order/";
  static const URL_USER = "user/";

  static List<Product> parseProducts(String response){
    var list = json.decode(response) as List<dynamic>;
    List<Product> products =list.map((json) => Product.fromJson(json)).toList();
    return products;
  }
  
  static User? parseUser(String res){
    Map<String,dynamic> user = json.decode(res) ;
    return User.fromJson(user);
  }

  static Future<List<Product>> fetchProducts({int page = 1}) async {
    var response = await http.get(Uri.parse(BASE_URL+URL_PRODUCT));
    if(response.statusCode ==200 ){
      return compute(parseProducts, response.body);
    } else if(response.statusCode == 400 ){
      throw Exception("Not found");
    } else {
      throw Exception("Can not get products");
    }

  }
  
  static Future<User?> fetchUserById(int id) async{
    var res = await http.get(Uri.parse(BASE_URL+URL_USER+"$id"));
    if(res.statusCode ==200 ){
      Map<String,dynamic> resJson = json.decode(res.body);
      return User.fromJson(resJson);
    }
    return null;
  }

}