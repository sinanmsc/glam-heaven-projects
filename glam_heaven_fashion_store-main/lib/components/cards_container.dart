import 'package:flutter/cupertino.dart';
import 'package:glam_heaven_fashion_store/extensions/responsive_extension.dart';

class CardsContainer extends StatelessWidget {
  const CardsContainer({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width(48),
      height: context.width(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          context.width(4),
        ),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
