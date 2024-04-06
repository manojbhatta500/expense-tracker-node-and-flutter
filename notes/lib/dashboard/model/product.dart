class ProductClass {
  String? sId;
  String? name;
  int? price;
  int? iV;

  ProductClass({this.sId, this.name, this.price, this.iV});

  ProductClass.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    price = json['price'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['__v'] = this.iV;
    return data;
  }
}
