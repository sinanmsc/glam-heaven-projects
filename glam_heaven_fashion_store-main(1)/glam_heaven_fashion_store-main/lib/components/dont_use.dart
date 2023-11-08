import 'package:flutter/material.dart';
import 'package:glam_heaven_fashion_store/extensions/responsive_extension.dart';

class Heightbetween extends StatelessWidget {
  const Heightbetween({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.width(height),
    );
  }
}

class Widthbetween extends StatelessWidget {
  const Widthbetween({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width(width),
    );
  }
}

class CategoryText extends StatelessWidget {
  const CategoryText(
      {super.key, required this.text1, required this.fontweight1});
  final text1;
  final FontWeight fontweight1;
  @override
  Widget build(BuildContext context) {
    return Text(
      text1,
      style: TextStyle(
          color: Colors.black,
          fontWeight: fontweight1,
          fontSize: context.width(18),
          fontFamily: 'Camforta'),
    );
  }
}
