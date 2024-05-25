class OrderModel {
  String? address;
  String? shippingCost;
  String? totalPrice;
  String? phone;
  String? name;
  String? userId;
  List<Items>? items;
  String? email;
  String? paymentType;
  String? dateTime;

  OrderModel(
      {this.address,
      this.shippingCost,
      this.totalPrice,
      this.phone,
      this.name,
      this.userId,
      this.items,
      this.email,
      this.paymentType,
      this.dateTime});

  OrderModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    shippingCost = json['shippingCost'];
    totalPrice = json['totalPrice'];
    phone = json['phone'];
    name = json['name'];
    userId = json['userId'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    email = json['email'];
    paymentType = json['paymentType'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['shippingCost'] = this.shippingCost;
    data['totalPrice'] = this.totalPrice;
    data['phone'] = this.phone;
    data['name'] = this.name;
    data['userId'] = this.userId;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['email'] = this.email;
    data['paymentType'] = this.paymentType;
    data['dateTime'] = this.dateTime;
    return data;
  }
}

class Items {
  String? quantity;
  String? productName;
  String? productImage;
  String? productId;
  String? price;

  Items(
      {this.quantity,
      this.productName,
      this.productImage,
      this.productId,
      this.price});

  Items.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    productName = json['productName'];
    productImage = json['productImage'];
    productId = json['productId'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    data['productName'] = this.productName;
    data['productImage'] = this.productImage;
    data['productId'] = this.productId;
    data['price'] = this.price;
    return data;
  }
}
