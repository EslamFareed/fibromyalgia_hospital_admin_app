import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fibromyalgia_hospital_admin_app/core/utils/collections_name.dart';
import 'package:fibromyalgia_hospital_admin_app/models/doctor_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());
  static DoctorCubit get(context) => BlocProvider.of(context);
  final firestore = FirebaseFirestore.instance;

  List<DoctorModel> doctors = [];

  void getDoctors() {
    emit(LoadingGetDoctorsState());
    try {
      firestore.collection(doctorsCollection).snapshots().listen((event) {
        emit(LoadingGetDoctorsState());
        doctors = event.docs.map((e) => DoctorModel.fromQuery(e)).toList();
        emit(SuccessGetDoctorsState());
      });
    } catch (e) {
      print(e.toString());
      emit(ErrorGetDoctorsState());
    }
  }

  void editDoctor(DoctorModel doctor) async {
    emit(LoadingEditDoctorsState());
    try {
      await firestore
          .collection(doctorsCollection)
          .doc(doctor.id)
          .set(doctor.toJson());
      emit(SuccessEditDoctorsState());
    } catch (e) {
      print(e.toString());
      emit(ErrorEditDoctorsState());
    }
  }
}
