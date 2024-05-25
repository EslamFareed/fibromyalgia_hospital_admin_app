import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorCateogryModel {
  String? name;
  String? id;

  DoctorCateogryModel({this.name, this.id});

  DoctorCateogryModel.fromJson(
      QueryDocumentSnapshot<Map<String, dynamic>> json) {
    name = json.data()['name'];
    id = json.id;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name};
  }
}
