import 'package:cloud_firestore/cloud_firestore.dart';

class PatientModel {
  String? image;
  String? name;
  String? email;
  String? phone;
  String? id;

  PatientModel({
    this.image,
    this.name,
    this.email,
    this.phone,
    this.id,
  });

  PatientModel.fromJson(QueryDocumentSnapshot<Map<String, dynamic>> json) {
    image = json.data()['image'];
    email = json.data()['email'];
    phone = json.data()['phone'];
    name = json.data()['name'];
    id = json.id;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'email': email,
      'phone': phone,
      'name': name
    };
  }
}
