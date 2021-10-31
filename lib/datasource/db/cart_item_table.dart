import 'package:shop_app_example/datasource/db/shop_db.dart';
import 'package:shop_app_example/models/cart_item.dart';

class CartItemTable{

  static const TABLE_NAME = "cart_item";
  static const CREATE_TABLE_QUERY = '''
     CREATE TABLE $TABLE_NAME(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        id_cart INTEGER.
        id_product INTEGER
     )
  ''';
  static const DROP_TABLE_QUERY = '''
      DROP TABLE IF EXISTS $TABLE_NAME
  ''';

  Future<int> insert(Item item)async{
    final db =await ShopDatabase.instance.database;
    return db.insert(TABLE_NAME, item.toMap());
  }

  Future<void> delete(Item item) async{
    final db =await ShopDatabase.instance.database;
    await db.delete(TABLE_NAME, where: "id = ?",whereArgs: [item.id]);
  }

  Future<void> clear(Item item) async{
    final db =await ShopDatabase.instance.database;
    await db.delete(TABLE_NAME);
  }

  Future<List<Item>> select(int idCart) async{
    final db =await ShopDatabase.instance.database;
    final List<Map<String, dynamic>> map = await db.query(TABLE_NAME,where: "idCart = ?",whereArgs: [idCart]);
    return List.generate(map.length, (index) =>
      Item.fromData(map[index]['id'], map[index]['idCart'], map[index]['productId'])
    );
  }
}