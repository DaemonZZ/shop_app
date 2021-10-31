import 'cart_item.dart';

class Cart {
   int id=0;
   int user = 0;
   List<Item> items = [];

  Cart.fromData(this.id,this.user,this.items);
  Cart.fromDb(this.id,this.user);

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items.add(Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user'] = user;
    if (items.isNotEmpty) {
      data['items'] = items.map((v) => v.toMap()).toList();
    }
    return data;
  }


  addItem(int productId){
      id>0 ? items.add(Item.fromData(0,id,productId)) : {
        throw Exception("Invalid cart")
      };
  }
}

