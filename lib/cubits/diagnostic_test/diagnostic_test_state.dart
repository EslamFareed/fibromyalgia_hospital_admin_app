part of 'diagnostic_test_cubit.dart';

@immutable
sealed class DiagnosticTestState {}

final class DiagnosticTestInitial extends DiagnosticTestState {}
//! -----------------------------------------------------------

class LoadingGetDiagnosticTestsState extends DiagnosticTestState {}

class ErrorGetDiagnosticTestsState extends DiagnosticTestState {}

class SuccessGetDiagnosticTestsState extends DiagnosticTestState {}

//! -----------------------------------------------------------
class LoadingCreateDiagnosticTestsState extends DiagnosticTestState {}

class ErrorCreateDiagnosticTestsState extends DiagnosticTestState {}

class SuccessCreateDiagnosticTestsState extends DiagnosticTestState {}
