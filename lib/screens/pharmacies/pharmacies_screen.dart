import 'package:fibromyalgia_hospital_admin_app/core/utils/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/pharmacy/pharmacy_cubit.dart';
import 'create_pharmacy_screen.dart';

class PharmacysScreen extends StatelessWidget {
  const PharmacysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = PharmacyCubit.get(context);
    cubit.getPharmacies();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NavigationHelper.goTo(context, const CreatePharmacyScreen());
        },
        backgroundColor: Colors.deepOrange,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(title: const Text("Pharmacys")),
      body: BlocBuilder<PharmacyCubit, PharmacyState>(
        builder: (context, state) {
          if (state is LoadingGetPharmacysState) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              final item = cubit.pharmacies[index];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(item.image!),
                  ),
                  title: Text("${item.name}"),
                  subtitle: Text(
                      "${item.discount}%\nrate : ${item.rate} stars\n${item.phone}\n${item.address}\nViews = ${item.viewCount}"),
                ),
              );
            },
            itemCount: cubit.pharmacies.length,
          );
        },
      ),
    );
  }
}
