import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorModel {
  String? licensingOrganization;
  String? image;
  String? address;
  String? categoryName;
  bool? confirmed;
  String? licensesNumber;
  String? password;
  String? cv;
  String? ratePerHour;
  String? name;
  String? email;
  String? categoryId;
  String? desc;
  String? id;

  DoctorModel(
      {this.licensingOrganization,
      this.image,
      this.address,
      this.categoryName,
      this.confirmed,
      this.licensesNumber,
      this.password,
      this.cv,
      this.ratePerHour,
      this.name,
      this.email,
      this.categoryId,
      this.id,
      this.desc});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    licensingOrganization = json['licensingOrganization'];
    image = json['image'];
    address = json['address'];
    categoryName = json['categoryName'];
    confirmed = json['confirmed'];
    licensesNumber = json['licensesNumber'];
    password = json['password'];
    cv = json['cv'];
    ratePerHour = json['ratePerHour'];
    name = json['name'];
    email = json['email'];
    categoryId = json['categoryId'];
    desc = json['desc'];
  }

  DoctorModel.fromQuery(QueryDocumentSnapshot<Map<String, dynamic>> json) {
    licensingOrganization = json.data()['licensingOrganization'];
    image = json.data()['image'];
    address = json.data()['address'];
    categoryName = json.data()['categoryName'];
    confirmed = json.data()['confirmed'];
    licensesNumber = json.data()['licensesNumber'];
    password = json.data()['password'];
    cv = json.data()['cv'];
    ratePerHour = json.data()['ratePerHour'];
    name = json.data()['name'];
    email = json.data()['email'];
    categoryId = json.data()['categoryId'];
    desc = json.data()['desc'];
    id = json.id;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['licensingOrganization'] = this.licensingOrganization;
    data['image'] = this.image;
    data['address'] = this.address;
    data['categoryName'] = this.categoryName;
    data['confirmed'] = this.confirmed;
    data['licensesNumber'] = this.licensesNumber;
    data['password'] = this.password;
    data['cv'] = this.cv;
    data['ratePerHour'] = this.ratePerHour;
    data['name'] = this.name;
    data['email'] = this.email;
    data['categoryId'] = this.categoryId;
    data['desc'] = this.desc;
    return data;
  }
}
