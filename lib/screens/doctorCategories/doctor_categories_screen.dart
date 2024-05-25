import 'package:fibromyalgia_hospital_admin_app/core/utils/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/doctor_category/doctor_category_cubit.dart';
import 'create_doctor_category_screen.dart';
import 'edit_doctor_category_screen.dart';

class DoctorCategoriesScreen extends StatelessWidget {
  const DoctorCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = DoctorCategoryCubit.get(context);
    cubit.getDoctorCategories();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NavigationHelper.goTo(context, CreateDoctorCategoryScreen());
        },
        backgroundColor: Colors.deepOrange,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(title: const Text("Doctor Categories")),
      body: BlocBuilder<DoctorCategoryCubit, DoctorCategoryState>(
        builder: (context, state) {
          if (state is LoadingGetDoctorCategoriesState) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              final item = cubit.cats[index];
              return Card(
                child: ListTile(
                  onTap: () {
                    NavigationHelper.goTo(
                        context, EditDoctorCategoryScreen(category: item));
                  },
                  trailing: const Icon(Icons.arrow_forward_ios, size: 10),
                  title: Text("${item.name}"),
                ),
              );
            },
            itemCount: cubit.cats.length,
          );
        },
      ),
    );
  }
}
