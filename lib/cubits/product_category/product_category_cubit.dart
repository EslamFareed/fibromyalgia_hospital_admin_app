import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fibromyalgia_hospital_admin_app/core/utils/collections_name.dart';
import 'package:fibromyalgia_hospital_admin_app/models/product_category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'product_category_state.dart';

class ProductCategoryCubit extends Cubit<ProductCategoryState> {
  ProductCategoryCubit() : super(ProductCategoryInitial());

  static ProductCategoryCubit get(context) => BlocProvider.of(context);
  final firestore = FirebaseFirestore.instance;

  List<ProductCateogryModel> cats = [];

  void getProductCategories() {
    emit(LoadingGetProductCategoriesState());

    try {
      firestore
          .collection(productCategoryCollection)
          .snapshots()
          .listen((event) {
        emit(LoadingGetProductCategoriesState());

        cats = event.docs.map((e) => ProductCateogryModel.fromJson(e)).toList();
        emit(SuccessGetProductCategoriesState());
      });
    } catch (e) {
      print(e.toString());
      emit(ErrorGetProductCategoriesState());
    }
  }

  void createProductCategory(ProductCateogryModel category) async {
    emit(LoadingCreateProductCategoriesState());
    try {
      await firestore
          .collection(productCategoryCollection)
          .add(category.toMap());
      emit(SuccessCreateProductCategoriesState());
    } catch (e) {
      print(e.toString());
      emit(ErrorCreateProductCategoriesState());
    }
  }

  void editProductCategory(ProductCateogryModel category) async {
    emit(LoadingEditProductCategoriesState());
    try {
      await firestore
          .collection(productCategoryCollection)
          .doc(category.id)
          .set(category.toMap());
      emit(SuccessEditProductCategoriesState());
    } catch (e) {
      print(e.toString());
      emit(ErrorEditProductCategoriesState());
    }
  }


}
