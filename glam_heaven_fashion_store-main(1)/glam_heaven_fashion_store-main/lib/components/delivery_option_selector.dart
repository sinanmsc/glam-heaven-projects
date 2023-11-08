import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glam_heaven_fashion_store/extensions/responsive_extension.dart';

class DeliveryOptionsSelection extends StatelessWidget {
  const DeliveryOptionsSelection(
      {super.key,
      required this.fontFamily,
      required this.icon,
      required this.text});

  final String fontFamily;
  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.width(30),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: context.width(16),
              fontFamily: fontFamily,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          icon
        ],
      ),
    );
  }
}
