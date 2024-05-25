part of 'product_category_cubit.dart';

@immutable
sealed class ProductCategoryState {}

final class ProductCategoryInitial extends ProductCategoryState {}

//! -----------------------------------------------------------

class LoadingGetProductCategoriesState extends ProductCategoryState {}

class ErrorGetProductCategoriesState extends ProductCategoryState {}

class SuccessGetProductCategoriesState extends ProductCategoryState {}
//! -----------------------------------------------------------

class LoadingCreateProductCategoriesState extends ProductCategoryState {}

class ErrorCreateProductCategoriesState extends ProductCategoryState {}

class SuccessCreateProductCategoriesState extends ProductCategoryState {}
//! -----------------------------------------------------------

class LoadingEditProductCategoriesState extends ProductCategoryState {}

class ErrorEditProductCategoriesState extends ProductCategoryState {}

class SuccessEditProductCategoriesState extends ProductCategoryState {}
//! -----------------------------------------------------------
