part of 'diagnostic_test_request_cubit.dart';

@immutable
sealed class DiagnosticTestRequestState {}

final class DiagnosticTestRequestInitial extends DiagnosticTestRequestState {}
//! -----------------------------------------------------------

class LoadingGetDiagnosticTestRequestsState
    extends DiagnosticTestRequestState {}

class ErrorGetDiagnosticTestRequestsState extends DiagnosticTestRequestState {}

class SuccessGetDiagnosticTestRequestsState
    extends DiagnosticTestRequestState {}
