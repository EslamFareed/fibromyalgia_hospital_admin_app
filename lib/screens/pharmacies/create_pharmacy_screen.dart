import 'dart:io';

import 'package:fibromyalgia_hospital_admin_app/core/components/default_button.dart';
import 'package:fibromyalgia_hospital_admin_app/core/components/default_text_field.dart';
import 'package:fibromyalgia_hospital_admin_app/core/utils/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../cubits/pharmacy/pharmacy_cubit.dart';
import '../../models/pharmacy_model.dart';

class CreatePharmacyScreen extends StatefulWidget {
  const CreatePharmacyScreen({super.key});

  @override
  State<CreatePharmacyScreen> createState() => _CreatePharmacyScreenState();
}

class _CreatePharmacyScreenState extends State<CreatePharmacyScreen> {
  final nameController = TextEditingController();
  final discountController = TextEditingController();
  final addressController = TextEditingController();
  final rateController = TextEditingController();
  final phoneController = TextEditingController();

  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Pharmacy"),
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
              controller: phoneController,
              label: "Phone",
              type: TextInputType.phone,
            ),
            const SizedBox(height: 10),
            DefaultTextField(
              controller: rateController,
              label: "Rate",
              type: TextInputType.number,
            ),
            const SizedBox(height: 10),
            DefaultTextField(
              controller: discountController,
              label: "Discount",
              type: TextInputType.number,
            ),
            const SizedBox(height: 10),
            DefaultTextField(
              controller: addressController,
              label: "Address",
            ),
            const SizedBox(height: 10),
            BlocConsumer<PharmacyCubit, PharmacyState>(
              listener: (context, state) {
                if (state is SuccessCreatePharmacysState) {
                  ShowSnack.showMessage(context, "Created Successfully");

                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                if (state is LoadingCreatePharmacysState) {
                  return const Center(child: CircularProgressIndicator());
                }
                return DefaultButton(
                  label: "Create",
                  onPressed: () {
                    if (nameController.text.isEmpty ||
                        addressController.text.isEmpty ||
                        rateController.text.isEmpty ||
                        phoneController.text.isEmpty ||
                        discountController.text.isEmpty ||
                        image == null) {
                      ShowSnack.showMessage(context, "Fill up all fields");
                    } else {
                      PharmacyCubit.get(context).createPharmacy(
                          PharmacyModel(
                            rate: rateController.text,
                            name: nameController.text,
                            address: addressController.text,
                            discount: discountController.text,
                            phone: phoneController.text,
                            viewCount: "0",
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
