import 'package:flutter/material.dart';
import 'package:glam_heaven_fashion_store/view/get_start.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateHome();
  }

  void navigateHome() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => GetStart(),
        ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF008fd3),
      body: Center(child: Image.asset('assets/images/blue_dribbble.gif')),
    );
  }
}
