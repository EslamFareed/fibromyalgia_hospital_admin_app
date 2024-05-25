part of 'doctor_category_cubit.dart';

@immutable
sealed class DoctorCategoryState {}

final class DoctorCategoryInitial extends DoctorCategoryState {}

//! -----------------------------------------------------------

class LoadingGetDoctorCategoriesState extends DoctorCategoryState {}

class ErrorGetDoctorCategoriesState extends DoctorCategoryState {}

class SuccessGetDoctorCategoriesState extends DoctorCategoryState {}
//! -----------------------------------------------------------

class LoadingCreateDoctorCategoriesState extends DoctorCategoryState {}

class ErrorCreateDoctorCategoriesState extends DoctorCategoryState {}

class SuccessCreateDoctorCategoriesState extends DoctorCategoryState {}
//! -----------------------------------------------------------

class LoadingEditDoctorCategoriesState extends DoctorCategoryState {}

class ErrorEditDoctorCategoriesState extends DoctorCategoryState {}

class SuccessEditDoctorCategoriesState extends DoctorCategoryState {}
//! -----------------------------------------------------------
