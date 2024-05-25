import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? image;
  String? rate;
  String? price;
  String? name;
  String? categoryName;
  String? categoryId;
  String? desc;
  String? id;

  ProductModel(
      {this.image,
      this.rate,
      this.price,
      this.name,
      this.categoryName,
      this.categoryId,
      this.desc,
      this.id});

  ProductModel.fromJson(QueryDocumentSnapshot<Map<String, dynamic>> json) {
    image = json.data()['image'];
    rate = json.data()['rate'];
    price = json.data()['price'];
    name = json.data()['name'];
    categoryName = json.data()['categoryName'];
    categoryId = json.data()['categoryId'];
    desc = json.data()['desc'];
    id = json.id;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'rate': rate,
      'price': price,
      'name': name,
      'categoryName': categoryName,
      'categoryId': categoryId,
      'desc': desc
    };
  }
}
