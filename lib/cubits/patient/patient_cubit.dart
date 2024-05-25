import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fibromyalgia_hospital_admin_app/core/utils/collections_name.dart';
import 'package:fibromyalgia_hospital_admin_app/models/patient_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  PatientCubit() : super(PatientInitial());

  static PatientCubit get(context) => BlocProvider.of(context);

  final firestore = FirebaseFirestore.instance;

  List<PatientModel> patients = [];

  void getPatients() {
    emit(LoadingGetPatientsState());

    try {
      firestore.collection(patientsCollection).snapshots().listen((event) {
        emit(LoadingGetPatientsState());

        patients = event.docs.map((e) => PatientModel.fromJson(e)).toList();
        emit(SuccessGetPatientsState());
      });
    } catch (e) {
      print(e.toString());
      emit(ErrorGetPatientsState());
    }
  }
}
