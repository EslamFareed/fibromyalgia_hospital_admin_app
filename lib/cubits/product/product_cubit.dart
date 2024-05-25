import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:fibromyalgia_hospital_admin_app/core/utils/collections_name.dart';
import 'package:fibromyalgia_hospital_admin_app/models/product_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  static ProductCubit get(context) => BlocProvider.of(context);

  final firestore = FirebaseFirestore.instance;

  List<ProductModel> products = [];

  void getProducts() {
    emit(LoadingGetProductsState());

    try {
      firestore.collection(productsCollection).snapshots().listen((event) {
        emit(LoadingGetProductsState());

        products = event.docs.map((e) => ProductModel.fromJson(e)).toList();
        emit(SuccessGetProductsState());
      });
    } catch (e) {
      print(e.toString());
      emit(ErrorGetProductsState());
    }
  }

  void createProduct(ProductModel product, XFile image) async {
    emit(LoadingCreateProductsState());
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final mountainImagesRef = storageRef.child("images/${image.name}");
      try {
        var response = await mountainImagesRef.putFile(File(image.path));

        String imageString = await response.ref.getDownloadURL();
        product.image = imageString;
      } catch (e) {
        print(e.toString());
        emit(ErrorCreateProductsState());
      }

      await firestore.collection(productsCollection).add(product.toMap());
      emit(SuccessCreateProductsState());
    } catch (e) {
      print(e.toString());
      emit(ErrorCreateProductsState());
    }
  }

  void editProduct(ProductModel product, XFile? image) async {
    emit(LoadingEditProductsState());
    try {
      if (image != null) {
        final storageRef = FirebaseStorage.instance.ref();
        final mountainImagesRef = storageRef.child("images/${image.name}");
        try {
          var response = await mountainImagesRef.putFile(File(image.path));

          String imageString = await response.ref.getDownloadURL();
          product.image = imageString;
        } catch (e) {
          print(e.toString());
          emit(ErrorEditProductsState());
        }
      }

      await firestore
          .collection(productsCollection)
          .doc(product.id)
          .set(product.toMap());
      emit(SuccessEditProductsState());
    } catch (e) {
      print(e.toString());
      emit(ErrorEditProductsState());
    }
  }


}
