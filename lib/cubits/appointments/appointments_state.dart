part of 'appointments_cubit.dart';

@immutable
sealed class AppointmentsState {}

final class AppointmentsInitial extends AppointmentsState {}
//! -----------------------------------------------------------

class LoadingGetAppointmentsState extends AppointmentsState {}

class ErrorGetAppointmentsState extends AppointmentsState {}

class SuccessGetAppointmentsState extends AppointmentsState {}
