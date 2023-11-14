import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glam_heaven_fashion_store/extensions/responsive_extension.dart';
import 'package:glam_heaven_fashion_store/provider/selection.dart';

import 'delivery_option_selector.dart';

class DeliveryOptions extends ConsumerWidget {
  const DeliveryOptions({
    super.key,
    required this.fontFamily,
  });

  final String fontFamily;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(
          context.width(14),
        ),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    context.width(20),
                  ),
                  topRight: Radius.circular(
                    context.width(20),
                  ),
                ),
              ),
              backgroundColor: const Color(0xffF6F6F6),
              content: Container(
                width: MediaQuery.of(context).size.width,
                height: context.width(307),
                color: const Color(0xffF6F6F6),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: context.width(61),
                        height: context.width(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            context.width(42),
                          ),
                          color: const Color(0xff660080),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: context.width(26),
                    ),
                    Center(
                      child: Text(
                        "Choose The Delivery Options",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: context.width(17),
                          fontFamily: fontFamily,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: context.width(8),
                    ),
                    Center(
                      child: Text(
                        "Cash on Delivery Might take 7-10 Buisness days..",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: context.width(13),
                          fontFamily: fontFamily,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: context.width(31),
                    ),
                    InkWell(
                      onTap: () {
                        ref.read(deliveryoptions.notifier).state = 0;
                      },
                      child: DeliveryOptionsSelection(
                        fontFamily: fontFamily,
                        icon: ref.watch(deliveryoptions) == 0
                            ? Icon(
                                CupertinoIcons.checkmark_alt_circle,
                                size: context.width(24),
                                color: Colors.green,
                              )
                            : Icon(
                                CupertinoIcons.circle,
                                size: context.width(24),
                              ),
                        text: "Cash On Delivery",
                      ),
                    ),
                    SizedBox(
                      height: context.width(35),
                    ),
                    InkWell(
                      onTap: () {
                        ref.read(deliveryoptions.notifier).state = 1;
                      },
                      child: DeliveryOptionsSelection(
                        fontFamily: fontFamily,
                        icon: ref.watch(deliveryoptions) == 1
                            ? Icon(
                                CupertinoIcons.checkmark_alt_circle,
                                size: context.width(24),
                                color: Colors.green,
                              )
                            : Icon(
                                CupertinoIcons.circle,
                                size: context.width(24),
                              ),
                        text: "Debit/Credit card payment",
                      ),
                    ),
                    SizedBox(
                      height: context.width(35),
                    ),
                    InkWell(
                      onTap: () {
                        ref.read(deliveryoptions.notifier).state = 2;
                      },
                      child: DeliveryOptionsSelection(
                        fontFamily: fontFamily,
                        icon: ref.watch(deliveryoptions) == 2
                            ? Icon(
                                CupertinoIcons.checkmark_alt_circle,
                                size: context.width(24),
                                color: Colors.green,
                              )
                            : Icon(
                                CupertinoIcons.circle,
                                size: context.width(24),
                              ),
                        text: "Bank Offers",
                      ),
                    ),
                  ],
                ),
              ),
              duration:
                  const Duration(seconds: 10), // Adjust the duration as needed.
            ),
          );
        },
        child: Container(
          width: context.width(297),
          height: context.width(59),
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.6,
              color: const Color(0xff9c9c9c),
            ),
            borderRadius: BorderRadius.circular(
              context.width(14),
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                width: context.width(15),
              ),
              SizedBox(
                height: context.width(44),
                width: context.width(44),
                child: Image.asset(
                  "assets/Transport free icons designed by Darius Dan.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: context.width(15),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Delivery Options",
                    style: TextStyle(
                      fontFamily: fontFamily,
                      fontWeight: FontWeight.w700,
                      fontSize: context.width(15),
                    ),
                  ),
                  SizedBox(
                    height: context.width(5),
                  ),
                  Text(
                    "Cash On Delivery",
                    style: TextStyle(
                      fontFamily: fontFamily,
                      fontWeight: FontWeight.w700,
                      fontSize: context.width(12),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Icon(
                CupertinoIcons.right_chevron,
                size: context.width(18),
              ),
              SizedBox(
                width: context.width(21),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
