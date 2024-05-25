import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fibromyalgia_hospital_admin_app/core/utils/collections_name.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../models/diagnostic_test_model.dart';

part 'diagnostic_test_state.dart';

class DiagnosticTestCubit extends Cubit<DiagnosticTestState> {
  DiagnosticTestCubit() : super(DiagnosticTestInitial());

  static DiagnosticTestCubit get(context) => BlocProvider.of(context);

  final firestore = FirebaseFirestore.instance;

  List<DiagnosticTestModel> diagnosticTests = [];

  void getDiagnosticTests() {
    emit(LoadingGetDiagnosticTestsState());

    try {
      firestore
          .collection(diagnosticTestsCollection)
          .snapshots()
          .listen((event) {
        emit(LoadingGetDiagnosticTestsState());

        diagnosticTests = event.docs
            .map((e) => DiagnosticTestModel.fromJson(e.data()))
            .toList();
        emit(SuccessGetDiagnosticTestsState());
      });
    } catch (e) {
      print(e.toString());
      emit(ErrorGetDiagnosticTestsState());
    }
  }

  void createDiagnosticTest(
      DiagnosticTestModel diagnosticTest, XFile image) async {
    emit(LoadingCreateDiagnosticTestsState());
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final mountainImagesRef = storageRef.child("images/${image.name}");
      try {
        var response = await mountainImagesRef.putFile(File(image.path));
        String imageString = await response.ref.getDownloadURL();
        diagnosticTest.image = imageString;
      } catch (e) {
        print(e.toString());
        emit(ErrorCreateDiagnosticTestsState());
      }
      await firestore
          .collection(diagnosticTestsCollection)
          .add(diagnosticTest.toJson());
      emit(SuccessCreateDiagnosticTestsState());
    } catch (e) {
      print(e.toString());
      emit(ErrorCreateDiagnosticTestsState());
    }
  }
}
