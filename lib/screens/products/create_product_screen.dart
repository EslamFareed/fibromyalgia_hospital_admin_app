import 'dart:io';

import 'package:fibromyalgia_hospital_admin_app/core/components/default_button.dart';
import 'package:fibromyalgia_hospital_admin_app/core/components/default_text_field.dart';
import 'package:fibromyalgia_hospital_admin_app/core/utils/navigation_helper.dart';
import 'package:fibromyalgia_hospital_admin_app/cubits/product/product_cubit.dart';
import 'package:fibromyalgia_hospital_admin_app/cubits/product_category/product_category_cubit.dart';
import 'package:fibromyalgia_hospital_admin_app/models/product_category_model.dart';
import 'package:fibromyalgia_hospital_admin_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class CreateProductScreen extends StatefulWidget {
  const CreateProductScreen({super.key});

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  @override
  void initState() {
    ProductCategoryCubit.get(context).getProductCategories();

    super.initState();
  }

  ProductCateogryModel? category;

  final nameController = TextEditingController();
  final descController = TextEditingController();
  final priceController = TextEditingController();
  final rateController = TextEditingController();

  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Product"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView(
          children: [
            GestureDetector(
              onTap: () async {
                image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                setState(() {});
              },
              child: image == null
                  ? const CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage("assets/images/placeholder.jpg"),
                    )
                  : CircleAvatar(
                      radius: 50,
                      backgroundImage: FileImage(File(image!.path)),
                    ),
            ),
            const SizedBox(height: 25),
            DefaultTextField(
              controller: nameController,
              label: "Name",
            ),
            const SizedBox(height: 10),
            DefaultTextField(
              controller: descController,
              label: "Description",
            ),
            const SizedBox(height: 10),
            DefaultTextField(
              controller: rateController,
              label: "Rate",
              type: TextInputType.number,
            ),
            const SizedBox(height: 10),
            DefaultTextField(
              controller: priceController,
              label: "Price",
              type: TextInputType.number,
            ),
            const SizedBox(height: 10),
            BlocBuilder<ProductCategoryCubit, ProductCategoryState>(
              builder: (context, state) {
                final cubit = ProductCategoryCubit.get(context);
                return DropdownButton<ProductCateogryModel>(
                  isExpanded: true,
                  hint: const Text("Please Choose category"),
                  items: cubit.cats
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.name ?? ""),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      category = value;
                    });
                  },
                  value: category,
                );
              },
            ),
            const SizedBox(height: 10),
            BlocConsumer<ProductCubit, ProductState>(
              listener: (context, state) {
                if (state is SuccessCreateProductsState) {
                  ShowSnack.showMessage(context, "Created Successfully");

                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                if (state is LoadingCreateProductsState) {
                  return const Center(child: CircularProgressIndicator());
                }
                return DefaultButton(
                  label: "Create",
                  onPressed: () {
                    if (nameController.text.isEmpty ||
                        descController.text.isEmpty ||
                        rateController.text.isEmpty ||
                        priceController.text.isEmpty ||
                        image == null ||
                        category == null) {
                      ShowSnack.showMessage(context, "Fill up all fields");
                    } else {
                      ProductCubit.get(context).createProduct(
                          ProductModel(
                            categoryId: category!.id,
                            categoryName: category!.name,
                            desc: descController.text,
                            price: priceController.text,
                            rate: rateController.text,
                            name: nameController.text,
                          ),
                          image!);
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
