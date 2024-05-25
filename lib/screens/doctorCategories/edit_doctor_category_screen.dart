import 'package:fibromyalgia_hospital_admin_app/core/components/default_button.dart';
import 'package:fibromyalgia_hospital_admin_app/core/components/default_text_field.dart';
import 'package:fibromyalgia_hospital_admin_app/core/utils/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/doctor_category/doctor_category_cubit.dart';
import '../../models/doctor_category_model.dart';

class EditDoctorCategoryScreen extends StatelessWidget {
  EditDoctorCategoryScreen({super.key, required this.category});

  DoctorCateogryModel category;

  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = category.name!;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Doctor Category"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView(
          children: [
            DefaultTextField(
              controller: nameController,
              label: "Name",
            ),
            const SizedBox(height: 10),
            BlocConsumer<DoctorCategoryCubit, DoctorCategoryState>(
              listener: (context, state) {
                if (state is SuccessEditDoctorCategoriesState) {
                  ShowSnack.showMessage(context, "Created Successfully");

                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                if (state is LoadingEditDoctorCategoriesState) {
                  return const Center(child: CircularProgressIndicator());
                }
                return DefaultButton(
                  label: "Save Changes",
                  onPressed: () {
                    if (nameController.text.isEmpty) {
                      ShowSnack.showMessage(context, "Fill up all fields");
                    } else {
                      category.name = nameController.text;

                      DoctorCategoryCubit.get(context)
                          .editDoctorCategory(category);
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
