import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glam_heaven_fashion_store/extensions/responsive_extension.dart';

class AuthTextField extends ConsumerWidget {
  final String hintText;
  final bool isThisForPassword;
  final void Function()? suffixIconOnpressed;
  final bool obscureText;
  const AuthTextField({
    super.key,
    required this.hintText,
    this.isThisForPassword = false,
    this.suffixIconOnpressed,
    required this.obscureText,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: context.width(15), vertical: context.width(15)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.width(30)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.width(30)),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color(0xFF1B1B56).withOpacity(0.2),
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: context.width(20),
            color: const Color(0xFF1B1B56),
            fontWeight: FontWeight.bold),
        suffixIcon: isThisForPassword == true
            ? IconButton(
                onPressed: suffixIconOnpressed,
                icon: obscureText == true
                    ? const Icon(
                        CupertinoIcons.eye_slash_fill,
                        color: Color(0xFF1B1B56),
                      )
                    : const Icon(Icons.remove_red_eye))
            : null,
      ),
      style: const TextStyle(fontSize: 20, color: Color(0xFF1B1B56)),
    );
  }
}
