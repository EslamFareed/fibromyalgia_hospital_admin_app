import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fibromyalgia_hospital_admin_app/core/utils/collections_name.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/diagnostic_test_request_model.dart';

part 'diagnostic_test_request_state.dart';

class DiagnosticTestRequestCubit extends Cubit<DiagnosticTestRequestState> {
  DiagnosticTestRequestCubit() : super(DiagnosticTestRequestInitial());

  static DiagnosticTestRequestCubit get(context) => BlocProvider.of(context);

  final firestore = FirebaseFirestore.instance;

  List<DiagnosticTestRequestModel> diagnosticTests = [];

  void getDiagnosticTestRequests() {
    emit(LoadingGetDiagnosticTestRequestsState());

    try {
      firestore
          .collection(diagnosticTestRequestsCollection)
          .snapshots()
          .listen((event) {
        emit(LoadingGetDiagnosticTestRequestsState());

        diagnosticTests = event.docs
            .map((e) => DiagnosticTestRequestModel.fromJson(e.data()))
            .toList();
        emit(SuccessGetDiagnosticTestRequestsState());
      });
    } catch (e) {
      print(e.toString());
      emit(ErrorGetDiagnosticTestRequestsState());
    }
  }
}
