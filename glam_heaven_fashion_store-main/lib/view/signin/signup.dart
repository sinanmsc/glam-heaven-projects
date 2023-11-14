import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glam_heaven_fashion_store/components/auth_textfield.dart';
import 'package:glam_heaven_fashion_store/components/home_bottomnavigation.dart';
import 'package:glam_heaven_fashion_store/extensions/responsive_extension.dart';
import 'package:glam_heaven_fashion_store/provider/auth_service_provider.dart';
import 'package:glam_heaven_fashion_store/provider/auth_ui_provider.dart';

class Signup extends ConsumerWidget {
  final void Function()? ontapToLoginpage;
  Signup({super.key, required this.ontapToLoginpage});
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1B56),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  alignment: const Alignment(0.6, -0.5),
                  height: context.height(250),
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/basker_right.png'),
                    ),
                  ),
                ),
                Positioned(
                  right: context.width(188),
                  bottom: context.width(78),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Register',
                        style: TextStyle(
                            fontFamily: 'sixcaps', fontSize: context.width(70)),
                      ),
                      Text(
                        'Creat Your new account',
                        style: TextStyle(
                          fontFamily: 'inter',
                          fontSize: context.width(15),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(context.width(70)))),
              height: MediaQuery.sizeOf(context).height - context.height(250),
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                children: [
                  SizedBox(height: context.width(50)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AuthTextField(
                            controller: name,
                            hintText: 'Last Name',
                            obscureText: false),
                        SizedBox(height: context.width(15)),
                        AuthTextField(
                            controller: email,
                            hintText: 'Email',
                            obscureText: false),
                        SizedBox(height: context.width(15)),
                        AuthTextField(
                          controller: password,
                          hintText: 'Password',
                          isThisForPassword: true,
                          obscureText: ref.watch(sigupEyeProvider),
                          suffixIconOnpressed: () {
                            ref.read(sigupEyeProvider.notifier).state =
                                !ref.read(sigupEyeProvider.notifier).state;
                          },
                        ),
                        SizedBox(height: context.width(15)),
                        AuthTextField(
                          controller: confirmPassword,
                          hintText: 'Confirm Password',
                          isThisForPassword: true,
                          obscureText: ref.watch(signupConfirmEyeProvider),
                          suffixIconOnpressed: () {
                            ref.read(signupConfirmEyeProvider.notifier).state =
                                !ref
                                    .read(signupConfirmEyeProvider.notifier)
                                    .state;
                          },
                        ),
                        SizedBox(height: context.width(15)),
                        SizedBox(
                          width: context.width(300),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.4),
                                  fontSize: context.width(17),
                                ),
                                children: const [
                                  TextSpan(
                                    text: 'By signing you agree to our ',
                                  ),
                                  TextSpan(
                                    text: 'Terms of use ',
                                    style: TextStyle(
                                        color: Color(0xFF1B1B56),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  TextSpan(
                                    text: 'and ',
                                  ),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF1B1B56),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                        SizedBox(
                          height: context.height(61),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BottomNavi(),
                                ));
                          },
                          child: InkWell(
                            onTap: () async {
                              if (name.text.isEmpty &&
                                  confirmPassword.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Please fill the blank fields')));
                              } else {
                                try {
                                  await ref
                                      .read(authServiceProvider)
                                      .signup(email.text, password.text)
                                      .then((value) => Navigator.pop(context));
                                } on FirebaseAuthException catch (e) {
                                  if (context.mounted) {
                                    log('$e');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('${e.message}')));
                                  }
                                }
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.sizeOf(context).width,
                              height: context.width(45),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: const Color(0xFF1B1B56),
                              ),
                              margin: EdgeInsets.only(bottom: context.width(5)),
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  fontFamily: 'inter',
                                  fontWeight: FontWeight.w900,
                                  fontSize: context.width(15),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account? ',
                              style: TextStyle(
                                fontFamily: 'inter',
                                fontSize: context.width(14),
                              ),
                            ),
                            InkWell(
                              onTap: ontapToLoginpage,
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontFamily: 'inter',
                                  fontWeight: FontWeight.w900,
                                  fontSize: context.width(14),
                                  color: const Color(0xFF1B1B56),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
