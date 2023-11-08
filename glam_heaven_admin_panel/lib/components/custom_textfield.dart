import 'package:flutter/material.dart';
import 'package:glam_heaven_admin_panel/extension/responsive.dart';

class CustomeTextField extends StatelessWidget {
  final String hintText;
  final double width;
  final TextEditingController controller;
  final String field;
  const CustomeTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.width,
    this.field = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(field, style: TextStyle(fontSize: context.width(22))),
            SizedBox(width: context.width(40)),
            SizedBox(
              width: width,
              child: TextFormField(
                key: key,
                controller: controller,
                // validator: (value) {
                //   if (value!.isEmpty && RegExp(r'/^[A-Z a-z]+$/').hasMatch(value)) {
                //     return 'Enter Correctly';
                //   }
                //   return null;
                // },
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: hintText,
                    hintStyle: TextStyle(fontSize: context.width(19))),
              ),
            ),
          ],
        ),
        SizedBox(height: context.height(15)),
      ],
    );
  }
}
