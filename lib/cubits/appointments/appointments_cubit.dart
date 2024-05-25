import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fibromyalgia_hospital_admin_app/core/utils/collections_name.dart';
import 'package:fibromyalgia_hospital_admin_app/models/appointment_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'appointments_state.dart';

class AppointmentsCubit extends Cubit<AppointmentsState> {
  AppointmentsCubit() : super(AppointmentsInitial());

  static AppointmentsCubit get(context) => BlocProvider.of(context);

  final firestore = FirebaseFirestore.instance;

  List<AppointmentModel> appointments = [];

  void getAppointments() {
    emit(LoadingGetAppointmentsState());

    try {
      firestore.collection(appointmentsCollection).snapshots().listen((event) {
        emit(LoadingGetAppointmentsState());

        appointments =
            event.docs.map((e) => AppointmentModel.fromJson(e.data())).toList();
        emit(SuccessGetAppointmentsState());
      });
    } catch (e) {
      print(e.toString());
      emit(ErrorGetAppointmentsState());
    }
  }
}
