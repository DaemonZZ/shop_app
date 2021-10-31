import 'package:shop_app_example/datasource/db/shop_db.dart';
import 'package:shop_app_example/models/session.dart';

class SessionTable{
  final db = ShopDatabase.instance.database;
  static const TABLE_NAME = "session";
  static const CREATE_TABLE_QUERY = '''
     CREATE TABLE $TABLE_NAME(id INTEGER PRIMARY KEY AUTOINCREMENT ,user INTEGER)''';
  static const INIT_QUERY = '''
      INSERT INTO $TABLE_NAME VALUES (1,0)
  ''';
  Future<int> insert()async{
    // await clear();
    final db =await ShopDatabase.instance.database;
    return db.insert(TABLE_NAME, {'user' : Session.user});
  }

  Future<void> clear() async{
    final db =await ShopDatabase.instance.database;
    await db.delete(TABLE_NAME);
  }
  Future<int> select() async{
    final db =await ShopDatabase.instance.database;
    final List<Map<String, dynamic>> map = await db.query(TABLE_NAME);
    var x = await map[0]['user'];
    print(x);
    return map[0]['user'];
  }
}