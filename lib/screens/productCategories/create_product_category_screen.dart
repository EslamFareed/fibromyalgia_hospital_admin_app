import 'package:fibromyalgia_hospital_admin_app/core/components/default_button.dart';
import 'package:fibromyalgia_hospital_admin_app/core/components/default_text_field.dart';
import 'package:fibromyalgia_hospital_admin_app/core/utils/navigation_helper.dart';
import 'package:fibromyalgia_hospital_admin_app/cubits/product_category/product_category_cubit.dart';
import 'package:fibromyalgia_hospital_admin_app/models/product_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateProductCategoryScreen extends StatelessWidget {
  CreateProductCategoryScreen({super.key});

  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Product Category"),
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
            BlocConsumer<ProductCategoryCubit, ProductCategoryState>(
              listener: (context, state) {
                if (state is SuccessCreateProductCategoriesState) {
                  ShowSnack.showMessage(context, "Created Successfully");

                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                if (state is LoadingCreateProductCategoriesState) {
                  return const Center(child: CircularProgressIndicator());
                }
                return DefaultButton(
                  label: "Create",
                  onPressed: () {
                    if (nameController.text.isEmpty) {
                      ShowSnack.showMessage(context, "Fill up all fields");
                    } else {
                      ProductCategoryCubit.get(context)
                          .createProductCategory(ProductCateogryModel(
                        name: nameController.text,
                      ));
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
