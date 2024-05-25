part of 'doctor_cubit.dart';

@immutable
sealed class DoctorState {}

final class DoctorInitial extends DoctorState {}

//! ----------------------------------------------------------

class LoadingGetDoctorsState extends DoctorState {}

class SuccessGetDoctorsState extends DoctorState {}

class ErrorGetDoctorsState extends DoctorState {}

//! ----------------------------------------------------------
class LoadingEditDoctorsState extends DoctorState {}

class SuccessEditDoctorsState extends DoctorState {}

class ErrorEditDoctorsState extends DoctorState {}
