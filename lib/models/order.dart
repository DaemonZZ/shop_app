class Order {
  int id = 0;
  int userId = 0;
  String address = "";
  String phone = "";
  int total = 0;
  int status = 0;

  Order(this.id, this.userId, this.address, this.phone, this.total, this.status);
  Order.init();

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    address = json['address'];
    phone = json['phone'];
    total = json['total'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['address'] = address;
    data['phone'] = phone;
    data['total'] = total;
    data['status'] = status;
    return data;
  }

}
