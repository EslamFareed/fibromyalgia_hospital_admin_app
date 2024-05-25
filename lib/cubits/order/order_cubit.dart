import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fibromyalgia_hospital_admin_app/core/utils/collections_name.dart';
import 'package:fibromyalgia_hospital_admin_app/models/order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  static OrderCubit get(context) => BlocProvider.of(context);

  final firestore = FirebaseFirestore.instance;

  List<OrderModel> orders = [];

  void getOrders() {
    emit(LoadingGetOrdersState());

    try {
      firestore.collection(ordersCollection).snapshots().listen((event) {
        emit(LoadingGetOrdersState());

        orders = event.docs.map((e) => OrderModel.fromJson(e.data())).toList();
        emit(SuccessGetOrdersState());
      });
    } catch (e) {
      print(e.toString());
      emit(ErrorGetOrdersState());
    }
  }
}
