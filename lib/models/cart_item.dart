class Item {
  int id = 0;
  int idCart = 0 ;
  int productId = 0;

  Item.fromData( this.id, this.idCart ,  this.productId , );
  Item();

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idCart = json['idCart'];
    productId = json['productId'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idCart'] = idCart;
    data['productId'] = productId;
    return data;
  }

}