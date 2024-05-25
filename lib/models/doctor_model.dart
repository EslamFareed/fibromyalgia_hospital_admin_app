import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorModel {
  String? image;
  String? address;
  String? rate;
  String? ratePerHour;
  String? name;
  String? patientsCount;
  String? location;
  bool? confirmed;
  String? categoryName;
  String? categoryId;
  String? desc;
  String? id;

  DoctorModel(
      {this.image,
      this.address,
      this.rate,
      this.ratePerHour,
      this.name,
      this.patientsCount,
      this.location,
      this.confirmed,
      this.categoryName,
      this.categoryId,
      this.desc,
      this.id});

  DoctorModel.fromJson(QueryDocumentSnapshot<Map<String, dynamic>> json) {
    image = json.data()['image'];
    address = json.data()['address'];
    rate = json.data()['rate'];
    ratePerHour = json.data()['ratePerHour'];
    name = json.data()['name'];
    patientsCount = json.data()['patientsCount'];
    location = json.data()['location'];
    confirmed = json.data()['confirmed'];
    categoryName = json.data()['categoryName'];
    categoryId = json.data()['categoryId'];
    desc = json.data()['desc'];
    id = json.id;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['address'] = this.address;
    data['rate'] = this.rate;
    data['ratePerHour'] = this.ratePerHour;
    data['name'] = this.name;
    data['patientsCount'] = this.patientsCount;
    data['location'] = this.location;
    data['confirmed'] = this.confirmed;
    data['categoryName'] = this.categoryName;
    data['categoryId'] = this.categoryId;
    data['desc'] = this.desc;

    return data;
  }
}
