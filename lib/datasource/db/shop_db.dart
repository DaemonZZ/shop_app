import 'dart:io';

import 'package:path/path.dart';
import 'package:shop_app_example/datasource/db/cart_item_table.dart';
import 'package:shop_app_example/datasource/db/session_table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class ShopDatabase {
  static const NAME = "shop_db";
  static const VERSION = 1;
  static Database? _database;

  ShopDatabase._internal();

  static final ShopDatabase instance = ShopDatabase._internal();

  Future<Database> get database async => _database ??= await _init();

  static const initQuery =[
    CartItemTable.CREATE_TABLE_QUERY,
    CartItemTable.CREATE_TABLE_QUERY,
    SessionTable.CREATE_TABLE_QUERY,
    SessionTable.INIT_QUERY
  ];


  Future<Database> _init() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path,NAME);
    return await openDatabase(
        path,
      onCreate: _onCreate,
      version: VERSION
    );
  }

  Future _onCreate(Database db, int version)async{
      initQuery.forEach((element) async => await db.execute(element));
  }


}

