import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fibromyalgia_hospital_admin_app/core/utils/collections_name.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../models/pharmacy_model.dart';

part 'pharmacy_state.dart';

class PharmacyCubit extends Cubit<PharmacyState> {
  PharmacyCubit() : super(PharmacyInitial());

  static PharmacyCubit get(context) => BlocProvider.of(context);

  final firestore = FirebaseFirestore.instance;

  List<PharmacyModel> pharmacies = [];

  void getPharmacies() {
    emit(LoadingGetPharmacysState());

    try {
      firestore.collection(pharmaciesCollection).snapshots().listen((event) {
        emit(LoadingGetPharmacysState());

        pharmacies =
            event.docs.map((e) => PharmacyModel.fromJson(e.data())).toList();
        emit(SuccessGetPharmacysState());
      });
    } catch (e) {
      print(e.toString());
      emit(ErrorGetPharmacysState());
    }
  }

  void createPharmacy(PharmacyModel pharmacy, XFile image) async {
    emit(LoadingCreatePharmacysState());
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final mountainImagesRef = storageRef.child("images/${image.name}");
      try {
        var response = await mountainImagesRef.putFile(File(image.path));

        String imageString = await response.ref.getDownloadURL();
        pharmacy.image = imageString;
      } catch (e) {
        print(e.toString());
        emit(ErrorCreatePharmacysState());
      }

      await firestore.collection(pharmaciesCollection).add(pharmacy.toJson());
      emit(SuccessCreatePharmacysState());
    } catch (e) {
      print(e.toString());
      emit(ErrorCreatePharmacysState());
    }
  }
}
