part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}
//! -----------------------------------------------------------

class LoadingGetOrdersState extends OrderState {}

class ErrorGetOrdersState extends OrderState {}

class SuccessGetOrdersState extends OrderState {}
