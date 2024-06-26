part of 'patient_cubit.dart';

@immutable
sealed class PatientState {}

final class PatientInitial extends PatientState {}
//! -----------------------------------------------------------

class LoadingGetPatientsState extends PatientState {}

class ErrorGetPatientsState extends PatientState {}

class SuccessGetPatientsState extends PatientState {}
