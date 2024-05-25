import 'package:fibromyalgia_hospital_admin_app/core/components/default_button.dart';
import 'package:fibromyalgia_hospital_admin_app/cubits/doctor/doctor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = DoctorCubit.get(context);
    cubit.getDoctors();
    return Scaffold(
      appBar: AppBar(title: const Text("Doctors")),
      body: BlocBuilder<DoctorCubit, DoctorState>(
        builder: (context, state) {
          if (state is LoadingGetDoctorsState ||
              state is LoadingEditDoctorsState) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              final item = cubit.doctors[index];
              return Card(
                child: ListTile(
                  onTap: item.confirmed!
                      ? null
                      : () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return BottomSheet(
                                onClosing: () {},
                                builder: (context) {
                                  return Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                .9,
                                        child: DefaultButton(
                                          label: "Refuse This Doctor",
                                          onPressed: () {
                                            item.confirmed = false;
                                            DoctorCubit.get(context)
                                                .editDoctor(item);
                                            Navigator.pop(context);
                                          },
                                          color: Colors.red,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                .9,
                                        child: DefaultButton(
                                          label: "Accept This Doctor",
                                          onPressed: () {
                                            item.confirmed = true;
                                            DoctorCubit.get(context)
                                                .editDoctor(item);
                                            Navigator.pop(context);
                                          },
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          );
                        },
                  trailing: Icon(
                      item.confirmed! ? Icons.check : Icons.arrow_forward_ios,
                      size: 25),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(item.image!),
                  ),
                  tileColor:
                      item.confirmed! ? Colors.greenAccent : Colors.redAccent,
                  title: Text("${item.name}"),
                  subtitle: Text(
                      " ${item.address}\n ${item.rate} stars\n rate per hour = ${item.ratePerHour}\n Specialization = ${item.categoryName}\n Patients Count = ${item.patientsCount}\n ${item.desc}"),
                ),
              );
            },
            itemCount: cubit.doctors.length,
          );
        },
      ),
    );
  }
}
