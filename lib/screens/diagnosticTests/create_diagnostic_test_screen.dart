import 'dart:io';

import 'package:fibromyalgia_hospital_admin_app/core/components/default_button.dart';
import 'package:fibromyalgia_hospital_admin_app/core/components/default_text_field.dart';
import 'package:fibromyalgia_hospital_admin_app/core/utils/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../cubits/diagnostic_test/diagnostic_test_cubit.dart';
import '../../models/diagnostic_test_model.dart';

class CreateDiagnosticTestScreen extends StatefulWidget {
  const CreateDiagnosticTestScreen({super.key});

  @override
  State<CreateDiagnosticTestScreen> createState() =>
      _CreateDiagnosticTestScreenState();
}

class _CreateDiagnosticTestScreenState
    extends State<CreateDiagnosticTestScreen> {
  final titleController = TextEditingController();
  final discountController = TextEditingController();
  final priceController = TextEditingController();
  final extraDescController = TextEditingController();
  final descController = TextEditingController();

  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Diagnostic Test"),
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
              controller: titleController,
              label: "Title",
            ),
            const SizedBox(height: 10),
            DefaultTextField(
              controller: descController,
              label: "Description",
              type: TextInputType.phone,
            ),
            const SizedBox(height: 10),
            DefaultTextField(
              controller: extraDescController,
              label: "Extra Description",
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
              controller: priceController,
              label: "Price",
            ),
            const SizedBox(height: 10),
            BlocConsumer<DiagnosticTestCubit, DiagnosticTestState>(
              listener: (context, state) {
                if (state is SuccessCreateDiagnosticTestsState) {
                  ShowSnack.showMessage(context, "Created Successfully");

                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                if (state is LoadingCreateDiagnosticTestsState) {
                  return const Center(child: CircularProgressIndicator());
                }
                return DefaultButton(
                  label: "Create",
                  onPressed: () {
                    if (titleController.text.isEmpty ||
                        priceController.text.isEmpty ||
                        discountController.text.isEmpty ||
                        extraDescController.text.isEmpty ||
                        descController.text.isEmpty ||
                        image == null) {
                      ShowSnack.showMessage(context, "Fill up all fields");
                    } else {
                      DiagnosticTestCubit.get(context).createDiagnosticTest(
                          DiagnosticTestModel(
                            desc: descController.text,
                            discount: discountController.text,
                            extraDesc: extraDescController.text,
                            price: priceController.text,
                            title: titleController.text,
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
