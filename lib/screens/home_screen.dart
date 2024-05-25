import 'package:fibromyalgia_hospital_admin_app/screens/appointments/appointments_screen.dart';
import 'package:fibromyalgia_hospital_admin_app/screens/diagnosticTestRequests/diagnostic_test_request_screen.dart';
import 'package:fibromyalgia_hospital_admin_app/screens/diagnosticTests/diagnostic_tests_screen.dart';
import 'package:fibromyalgia_hospital_admin_app/screens/doctorCategories/doctor_categories_screen.dart';
import 'package:fibromyalgia_hospital_admin_app/screens/doctors/doctors_screen.dart';
import 'package:fibromyalgia_hospital_admin_app/screens/orders/orders_screen.dart';
import 'package:fibromyalgia_hospital_admin_app/screens/patients/patients_screen.dart';
import 'package:fibromyalgia_hospital_admin_app/screens/pharmacies/pharmacies_screen.dart';
import 'package:fibromyalgia_hospital_admin_app/screens/productCategories/product_categories_screen.dart';
import 'package:flutter/material.dart';

import '../core/utils/navigation_helper.dart';
import 'products/products_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.dashboard),
              onTap: () {
                NavigationHelper.goTo(context, const PatientsScreen());
              },
              title: const Text("Patients"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 12,
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.dashboard),
              onTap: () {
                NavigationHelper.goTo(context, const DoctorsScreen());
              },
              title: const Text("Doctors"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 12,
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.dashboard),
              onTap: () {
                NavigationHelper.goTo(context, const AppointmentsScreen());
              },
              title: const Text("Appointments"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 12,
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.dashboard),
              onTap: () {
                NavigationHelper.goTo(context, const OrdersScreen());
              },
              title: const Text("Orders"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 12,
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.dashboard),
              onTap: () {
                NavigationHelper.goTo(context, const ProductsScreen());
              },
              title: const Text("Products"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 12,
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.dashboard),
              onTap: () {
                NavigationHelper.goTo(context, const ProductCategoriesScreen());
              },
              title: const Text("Product Categories"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 12,
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.dashboard),
              onTap: () {
                NavigationHelper.goTo(context, const DoctorCategoriesScreen());
              },
              title: const Text("Doctor Categories"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 12,
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.dashboard),
              onTap: () {
                NavigationHelper.goTo(context, const PharmacysScreen());
              },
              title: const Text("Pharmacies"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 12,
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.dashboard),
              onTap: () {
                NavigationHelper.goTo(context, const DiagnosticTestsScreen());
              },
              title: const Text("Diagnostic Tests"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 12,
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.dashboard),
              onTap: () {
                NavigationHelper.goTo(
                    context, const DiagnosticTestRequestsScreen());
              },
              title: const Text("Diagnostic Test Request"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
