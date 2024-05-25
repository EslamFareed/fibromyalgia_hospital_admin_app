import 'package:fibromyalgia_hospital_admin_app/cubits/patient/patient_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/appointments/appointments_cubit.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = AppointmentsCubit.get(context);
    cubit.getAppointments();
    return Scaffold(
      appBar: AppBar(title: const Text("Appointments")),
      body: BlocBuilder<AppointmentsCubit, AppointmentsState>(
        builder: (context, state) {
          if (state is LoadingGetAppointmentsState) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              final item = cubit.appointments[index];
              return Card(
                child: ListTile(
                  title: Text("Patinet : ${item.patinetName}"),
                  subtitle: Text(
                      " Doctor : ${item.doctorName}\n for who : ${item.forWho}\n Payment Type : ${item.paymentType}\n status : ${item.status}\n Date and Time : ${item.day} - ${item.time}\n type : ${item.type}"),
                ),
              );
            },
            itemCount: cubit.appointments.length,
          );
        },
      ),
    );
  }
}
