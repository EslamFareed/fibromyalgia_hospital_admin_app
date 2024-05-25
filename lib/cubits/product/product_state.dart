part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

//! -----------------------------------------------------------

class LoadingGetProductsState extends ProductState {}

class ErrorGetProductsState extends ProductState {}

class SuccessGetProductsState extends ProductState {}

//! -----------------------------------------------------------
class LoadingCreateProductsState extends ProductState {}

class ErrorCreateProductsState extends ProductState {}

class SuccessCreateProductsState extends ProductState {}
//! -----------------------------------------------------------

class LoadingEditProductsState extends ProductState {}

class ErrorEditProductsState extends ProductState {}

class SuccessEditProductsState extends ProductState {}
//! -----------------------------------------------------------
