part of 'pharmacy_cubit.dart';

@immutable
sealed class PharmacyState {}

final class PharmacyInitial extends PharmacyState {}
//! -----------------------------------------------------------

class LoadingGetPharmacysState extends PharmacyState {}

class ErrorGetPharmacysState extends PharmacyState {}

class SuccessGetPharmacysState extends PharmacyState {}

//! -----------------------------------------------------------
class LoadingCreatePharmacysState extends PharmacyState {}

class ErrorCreatePharmacysState extends PharmacyState {}

class SuccessCreatePharmacysState extends PharmacyState {}
