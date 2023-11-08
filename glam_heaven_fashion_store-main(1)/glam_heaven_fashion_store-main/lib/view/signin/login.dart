import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glam_heaven_fashion_store/components/auth_textfield.dart';
import 'package:glam_heaven_fashion_store/extensions/responsive_extension.dart';
import 'package:glam_heaven_fashion_store/provider/auth_provider.dart';
import 'package:glam_heaven_fashion_store/view/signin/signup.dart';

class Login extends ConsumerWidget {
  const Login({super.key});

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
                  alignment: Alignment(0.6, -0.5),
                  height: context.height(250),
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/basket.png'),
                    ),
                  ),
                ),
                Positioned(
                  left: context.width(168),
                  bottom: context.width(78),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hout',
                        style: TextStyle(
                            fontFamily: 'sixcaps', fontSize: context.width(70)),
                      ),
                      Text(
                        'Choose Your Own Fashion',
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
                  SizedBox(height: context.width(65)),
                  Column(
                    children: [
                      Text(
                        'WELCOME BACK',
                        style: TextStyle(
                          fontFamily: 'sixcaps',
                          fontWeight: FontWeight.w500,
                          fontSize: context.width(70),
                        ),
                      ),
                      Text(
                        'Login to your account',
                        style: TextStyle(
                            fontFamily: 'inter',
                            fontWeight: FontWeight.bold,
                            fontSize: context.width(21),
                            color: Colors.black.withOpacity(0.5)),
                      ),
                    ],
                  ),
                  SizedBox(height: context.width(32)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const AuthTextField(
                            hintText: 'Email/Username', obscureText: false),
                        SizedBox(height: context.width(30)),
                        AuthTextField(
                          hintText: 'Password',
                          isThisForPassword: true,
                          obscureText: ref.watch(loginEyeProvider),
                          suffixIconOnpressed: () {
                            ref.read(loginEyeProvider.notifier).state =
                                !ref.read(loginEyeProvider.notifier).state;
                          },
                        ),
                        SizedBox(height: context.width(10)),
                        Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontFamily: 'inter',
                            fontWeight: FontWeight.w900,
                            fontSize: context.width(15),
                            color: const Color(0xFF1B1B56),
                          ),
                        ),
                        SizedBox(height: context.width(92)),
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.sizeOf(context).width,
                          height: context.width(45),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color(0xFF1B1B56),
                          ),
                          margin: EdgeInsets.only(bottom: context.width(7)),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontFamily: 'inter',
                              fontWeight: FontWeight.w900,
                              fontSize: context.width(15),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account? ',
                                style: TextStyle(
                                  fontFamily: 'inter',
                                  fontSize: context.width(14),
                                ),
                              ),
                              InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Signup(),
                                    )),
                                child: Text(
                                  'Sign up',
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
