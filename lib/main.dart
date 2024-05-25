import 'package:fibromyalgia_hospital_admin_app/cubits/appointments/appointments_cubit.dart';
import 'package:fibromyalgia_hospital_admin_app/cubits/diagnostic_test/diagnostic_test_cubit.dart';
import 'package:fibromyalgia_hospital_admin_app/cubits/diagnostic_test_request/diagnostic_test_request_cubit.dart';
import 'package:fibromyalgia_hospital_admin_app/cubits/doctor/doctor_cubit.dart';
import 'package:fibromyalgia_hospital_admin_app/cubits/doctor_category/doctor_category_cubit.dart';
import 'package:fibromyalgia_hospital_admin_app/cubits/order/order_cubit.dart';
import 'package:fibromyalgia_hospital_admin_app/cubits/patient/patient_cubit.dart';
import 'package:fibromyalgia_hospital_admin_app/cubits/pharmacy/pharmacy_cubit.dart';
import 'package:fibromyalgia_hospital_admin_app/cubits/product/product_cubit.dart';
import 'package:fibromyalgia_hospital_admin_app/cubits/product_category/product_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../screens/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DiagnosticTestRequestCubit()),
        BlocProvider(create: (context) => DiagnosticTestCubit()),
        BlocProvider(create: (context) => AppointmentsCubit()),
        BlocProvider(create: (context) => PatientCubit()),
        BlocProvider(create: (context) => OrderCubit()),
        BlocProvider(create: (context) => ProductCubit()),
        BlocProvider(create: (context) => DoctorCubit()),
        BlocProvider(create: (context) => ProductCategoryCubit()),
        BlocProvider(create: (context) => DoctorCategoryCubit()),
        BlocProvider(create: (context) => PharmacyCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(
            foregroundColor: Colors.white,
            backgroundColor: Colors.deepOrange,
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
