import 'package:flutter/cupertino.dart';
import 'package:glam_heaven_fashion_store/extensions/responsive_extension.dart';

class ApplyPromoCodeWidget extends StatelessWidget {
  const ApplyPromoCodeWidget({
    super.key,
    required this.fontFamily,
  });

  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: context.width(295),
        height: context.width(
          49,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.6,
            color: const Color(0xffababab),
          ),
          borderRadius: BorderRadius.circular(
            context.width(
              13,
            ),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: context.width(15),
            ),
            SizedBox(
              height: context.width(35),
              width: context.width(35),
              child: Image.asset(
                "assets/—Pngtree—coupon icon_5464851.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: context.width(23),
            ),
            Text(
              "Apply Promo Code",
              style: TextStyle(
                fontFamily: fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: context.width(12),
              ),
            ),
            const Spacer(),
            Icon(
              CupertinoIcons.right_chevron,
              size: context.width(18),
            ),
            SizedBox(
              width: context.width(19),
            )
          ],
        ),
      ),
    );
  }
}
