import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fibromyalgia_hospital_admin_app/core/utils/collections_name.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/doctor_category_model.dart';

part 'doctor_category_state.dart';

class DoctorCategoryCubit extends Cubit<DoctorCategoryState> {
  DoctorCategoryCubit() : super(DoctorCategoryInitial());

  static DoctorCategoryCubit get(context) => BlocProvider.of(context);
  final firestore = FirebaseFirestore.instance;

  List<DoctorCateogryModel> cats = [];

  void getDoctorCategories() {
    emit(LoadingGetDoctorCategoriesState());

    try {
      firestore
          .collection(doctorCategoryCollection)
          .snapshots()
          .listen((event) {
        emit(LoadingGetDoctorCategoriesState());

        cats = event.docs.map((e) => DoctorCateogryModel.fromJson(e)).toList();
        emit(SuccessGetDoctorCategoriesState());
      });
    } catch (e) {
      print(e.toString());
      emit(ErrorGetDoctorCategoriesState());
    }
  }

  void createDoctorCategory(DoctorCateogryModel category) async {
    emit(LoadingCreateDoctorCategoriesState());
    try {
      await firestore
          .collection(doctorCategoryCollection)
          .add(category.toMap());
      emit(SuccessCreateDoctorCategoriesState());
    } catch (e) {
      print(e.toString());
      emit(ErrorCreateDoctorCategoriesState());
    }
  }

  void editDoctorCategory(DoctorCateogryModel category) async {
    emit(LoadingEditDoctorCategoriesState());
    try {
      await firestore
          .collection(doctorCategoryCollection)
          .doc(category.id)
          .set(category.toMap());
      emit(SuccessEditDoctorCategoriesState());
    } catch (e) {
      print(e.toString());
      emit(ErrorEditDoctorCategoriesState());
    }
  }
}
