// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';k
import 'package:glam_heaven_fashion_store/extensions/responsive_extension.dart';
// import 'package:glam_heaven_fashion_store/provider/providers.dart';

class FilterCustom extends StatelessWidget {
  final String text;
  final void Function()? ontap;
  final Color colorr;
  final bool selected;

  const FilterCustom(
      {super.key,
      required this.selected,
      required this.text,
      required this.ontap,
      required this.colorr});

  @override
  Widget build(
    BuildContext context,
  ) {
    // final colorpro = ref.watch(filterProvider);
    return Row(
      children: [
        InkWell(
          onTap: ontap,
          child: Container(
            width: context.width(16),
            height: context.width(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                context.width(16),
              ),
              color: selected ? Colors.green : const Color(0xffD9D9D9),
              // border: Border.all(
              //     color: colorpro == false
              //         ? Colors.green
              //         : const Color(0xffD9D9D9)),
            ),
          ),
        ),
        SizedBox(
          width: context.width(13),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: context.width(15),
              fontFamily: 'Comfortaa',
              color: const Color(0xff797070)),
        )
      ],
    );
  }
}
