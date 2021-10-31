class Product {
  int id = 0;
  String title = "";
  String description = "";
  String image = "";
  int price = 0;
  String color = "";
  int typeId = 0;

  Product(this.id, this.title, this.description, this.image, this.price,
      this.color, this.typeId);
  Product.init();

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    color = json['color'];
    typeId = json['typeId'];
  }
  static const IMG_URL = "https://raw.githubusercontent.com/DaemonZZ/fake_api_for_flutter/main/images/";
  int get colorCode => int.parse(color);
  String get imgUrl => IMG_URL+image;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['price'] = price;
    data['color'] = color;
    data['typeId'] = typeId;
    return data;
  }
}
