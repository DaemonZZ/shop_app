import 'package:shop_app_example/datasource/db/shop_db.dart';
import 'package:shop_app_example/models/cart.dart';

class CartTable {
  static const TABLE_NAME = "cart";
  static const CREATE_TABLE_QUERY = '''
     CREATE TABLE $TABLE_NAME(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user INTEGER.
     )
  ''';
  static const DROP_TABLE_QUERY = '''
      DROP TABLE IF EXISTS $TABLE_NAME
  ''';

  Future<int> insert(Cart cart)async{
    final db =await ShopDatabase.instance.database;
    return db.insert(TABLE_NAME, cart.toMap());
  }

  Future<void> delete(Cart cart) async{
    final db =await ShopDatabase.instance.database;
    await db.delete(TABLE_NAME, where: "id = ?",whereArgs: [cart.id]);
  }

  Future<void> clear(Cart cart) async{
    final db =await ShopDatabase.instance.database;
    await db.delete(TABLE_NAME);
  }

  Future<List<Cart>> select(int id) async{
    final db =await ShopDatabase.instance.database;
    final List<Map<String, dynamic>> map = await db.query(TABLE_NAME,where: "id = ?",whereArgs: [id]);
    return List.generate(map.length, (index) =>
        Cart.fromDb(map[index]['id'], map[index]['user'])
    );
  }
}