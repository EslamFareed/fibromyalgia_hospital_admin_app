import 'package:fibromyalgia_hospital_admin_app/core/utils/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/diagnostic_test/diagnostic_test_cubit.dart';
import 'create_diagnostic_test_screen.dart';

class DiagnosticTestsScreen extends StatelessWidget {
  const DiagnosticTestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = DiagnosticTestCubit.get(context);
    cubit.getDiagnosticTests();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NavigationHelper.goTo(context, const CreateDiagnosticTestScreen());
        },
        backgroundColor: Colors.deepOrange,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(title: const Text("Diagnostic Tests")),
      body: BlocBuilder<DiagnosticTestCubit, DiagnosticTestState>(
        builder: (context, state) {
          if (state is LoadingGetDiagnosticTestsState) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              final item = cubit.diagnosticTests[index];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(item.image!),
                  ),
                  title: Text("${item.title}"),
                  subtitle: Text(
                      "${item.desc}%\n${item.extraDesc}\nPrice : ${item.price}\n${item.discount}%"),
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
