import 'package:fibromyalgia_hospital_admin_app/cubits/diagnostic_test_request/diagnostic_test_request_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiagnosticTestRequestsScreen extends StatelessWidget {
  const DiagnosticTestRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = DiagnosticTestRequestCubit.get(context);
    cubit.getDiagnosticTestRequests();
    return Scaffold(
      appBar: AppBar(title: const Text("Diagnostic Test Requests")),
      body: BlocBuilder<DiagnosticTestRequestCubit, DiagnosticTestRequestState>(
        builder: (context, state) {
          if (state is LoadingGetDiagnosticTestRequestsState) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              final item = cubit.diagnosticTests[index];
              return Card(
                child: ListTile(
                  title: Text("Patient Name : ${item.patientName}"),
                  subtitle: Text(
                      "Price : ${item.diagnosticTestPrice}%\n${item.email}\n${item.gender}\n${item.age} years old"),
                ),
              );
            },
            itemCount: cubit.diagnosticTests.length,
          );
        },
      ),
    );
  }
}
