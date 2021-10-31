class Type {
  int id = 0;
  String typeName = "";

  Type(this.id, this.typeName);
  Type.init();

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeName = json['typeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['typeName'] = typeName;
    return data;
  }
}
