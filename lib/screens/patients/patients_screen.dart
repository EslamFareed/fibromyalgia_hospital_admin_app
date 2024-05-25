import 'package:fibromyalgia_hospital_admin_app/cubits/patient/patient_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientsScreen extends StatelessWidget {
  const PatientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = PatientCubit.get(context);
    cubit.getPatients();
    return Scaffold(
      appBar: AppBar(title: const Text("Patients")),
      body: BlocBuilder<PatientCubit, PatientState>(
        builder: (context, state) {
          if (state is LoadingGetPatientsState) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              final item = cubit.patients[index];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(item.image!),
                  ),
                  title: Text("${item.name}"),
                  subtitle: Text("${item.email}\n${item.phone}"),
                ),
              );
            },
            itemCount: cubit.patients.length,
          );
        },
      ),
    );
  }
}
