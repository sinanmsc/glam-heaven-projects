import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glam_heaven_fashion_store/extensions/responsive_extension.dart';

class PriceDetailsWidget extends StatelessWidget {
  const PriceDetailsWidget(
      {super.key,
      this.color = Colors.black,
      required this.fontFamily,
      required this.detailsd,
      required this.detailsedcontext});

  final String fontFamily;
  final String detailsd;
  final String detailsedcontext;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          detailsd,
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: context.width(12),
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        Text(
          detailsedcontext,
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: context.width(12),
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
      ],
    );
  }
}
