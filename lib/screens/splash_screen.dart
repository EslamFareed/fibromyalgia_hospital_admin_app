import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.sizeOf(context).height * .25,
                ),
                child: SvgPicture.asset("assets/icons/splash_screen_icon.svg")),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              margin: EdgeInsets.only(
                bottom: MediaQuery.sizeOf(context).height * .25,
              ),
              child: const Column(
                children: [
                  CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
