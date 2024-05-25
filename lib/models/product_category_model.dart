import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCateogryModel {
  String? name;
  String? id;

  ProductCateogryModel({this.name, this.id});

  ProductCateogryModel.fromJson(
      QueryDocumentSnapshot<Map<String, dynamic>> json) {
    name = json.data()['name'];
    id = json.id;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name};
  }
}
