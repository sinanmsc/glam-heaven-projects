import 'package:flutter/material.dart';
import 'package:glam_heaven_fashion_store/view/signin/login.dart';
import 'package:glam_heaven_fashion_store/view/signin/signup.dart';

class AuthPageview extends StatelessWidget {
  AuthPageview({super.key});

  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          Login(
            ontapToSignupage: () => _pageController.animateToPage(1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.linearToEaseOut),
          ),
          Signup(
            ontapToLoginpage: () => _pageController.animateToPage(0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.linearToEaseOut),
          ),
        ],
      ),
    );
  }
}
