import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glam_heaven_fashion_store/components/apply_promo_code.dart';
import 'package:glam_heaven_fashion_store/components/cards_container.dart';
import 'package:glam_heaven_fashion_store/components/delivery_options.dart';
import 'package:glam_heaven_fashion_store/components/price_details.dart';
import 'package:glam_heaven_fashion_store/components/saved_accounts.dart';
import 'package:glam_heaven_fashion_store/extensions/responsive_extension.dart';
import 'package:glam_heaven_fashion_store/provider/selection.dart';

class PaymentPage extends ConsumerWidget {
  const PaymentPage({super.key});

  final String fontFamily = "Comfortaa";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: context.width(63),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(
          CupertinoIcons.left_chevron,
          size: context.width(18),
          color: Colors.black,
        ),
        bottom: AppBar(
          elevation: 0,
          toolbarHeight: 0.5,
          backgroundColor: Colors.grey,
        ),
        title: Text(
          "Payments",
          style: TextStyle(
            fontSize: context.width(18),
            fontFamily: fontFamily,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: context.width(31),
          right: context.width(31),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.width(37),
              ),
              Text(
                textAlign: TextAlign.start,
                "Saved Accounts",
                style: TextStyle(
                  fontSize: context.width(17),
                  fontWeight: FontWeight.w700,
                  fontFamily: fontFamily,
                ),
              ),
              SizedBox(
                height: context.width(24),
              ),
              InkWell(
                onTap: () {
                  ref.read(savedaccountsSelection.notifier).state = 0;
                },
                child: SavedAccountsContainer(
                  bankimage: "assets/icici.jpeg",
                  bankname: "ICICI",
                  accountNumber: "7349",
                  selectedicon: ref.watch(savedaccountsSelection) == 0
                      ? Icon(
                          CupertinoIcons.checkmark_alt_circle,
                          color: Colors.green,
                          size: context.width(25),
                        )
                      : Icon(
                          CupertinoIcons.circle,
                          color: Colors.black,
                          size: context.width(25),
                        ),
                ),
              ),
              SizedBox(
                height: context.width(15),
              ),
              InkWell(
                onTap: () {
                  ref.read(savedaccountsSelection.notifier).state = 1;
                },
                child: SavedAccountsContainer(
                  bankimage: "assets/Sbi.jpeg",
                  bankname: "SBI",
                  accountNumber: "4532",
                  selectedicon: ref.watch(savedaccountsSelection) == 1
                      ? Icon(
                          CupertinoIcons.checkmark_alt_circle,
                          color: Colors.green,
                          size: context.width(25),
                        )
                      : Icon(
                          CupertinoIcons.circle,
                          color: Colors.black,
                          size: context.width(25),
                        ),
                ),
              ),
              SizedBox(
                height: context.width(34),
              ),
              DeliveryOptions(fontFamily: fontFamily),
              SizedBox(
                height: context.width(36),
              ),
              ApplyPromoCodeWidget(fontFamily: fontFamily),
              SizedBox(
                height: context.width(31),
              ),
              Text(
                "Price Details",
                style: TextStyle(
                    fontSize: context.width(17),
                    fontFamily: fontFamily,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: context.width(18),
              ),
              const Divider(
                // height: 1,
                color: Color(0xffc9c9c9),
                thickness: 1,
              ),
              SizedBox(
                height: context.width(18),
              ),
              PriceDetailsWidget(
                fontFamily: fontFamily,
                detailsd: "Price",
                detailsedcontext: "\$199",
              ),
              SizedBox(
                height: context.width(18),
              ),
              PriceDetailsWidget(
                fontFamily: fontFamily,
                detailsd: "Delivery Charges",
                detailsedcontext: "Free",
                color: const Color(0xFF0FAF00),
              ),
              SizedBox(
                height: context.width(18),
              ),
              const Divider(
                // height: 1,
                color: Color(0xffc9c9c9),
                thickness: 1,
              ),
              SizedBox(
                height: context.width(25),
              ),
              Row(
                children: [
                  Text(
                    "Totel Payble",
                    style: TextStyle(
                      fontFamily: fontFamily,
                      fontWeight: FontWeight.w700,
                      fontSize: context.width(17),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "\$199",
                    style: TextStyle(
                        fontSize: context.width(15),
                        fontFamily: fontFamily,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(
                height: context.width(23),
              ),
              Container(
                width: context.width(315),
                height: context.width(44),
                decoration: BoxDecoration(
                  color: const Color(0xffedf2ff),
                  borderRadius: BorderRadius.circular(
                    context.width(12),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CardsContainer(
                      image:
                          "assets/VISA Logo and symbol, meaning, history, PNG, brand.jpeg",
                    ),
                    CardsContainer(
                      image: "assets/MasterCard 1990 logo.jpeg",
                    ),
                    CardsContainer(
                      image: "assets/International Shipping - Etsy (copy).jpeg",
                    ),
                    CardsContainer(
                      image:
                          "assets/Another Christian Viewpoint Banned (copy).jpeg",
                    )
                  ],
                ),
              ),
              SizedBox(
                height: context.width(30),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: context.width(100),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width(31),
          ),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "\$199",
                    style: TextStyle(
                      fontFamily: fontFamily,
                      fontWeight: FontWeight.w700,
                      fontSize: context.width(18),
                    ),
                  ),
                  SizedBox(
                    height: context.width(11),
                  ),
                  Text(
                    "Details",
                    style: TextStyle(
                      fontFamily: fontFamily,
                      color: const Color(0xFF192DFF),
                      fontWeight: FontWeight.w700,
                      fontSize: context.width(12),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                width: context.width(131),
                height: context.width(39),
                decoration: BoxDecoration(
                  color: const Color(0xfffaba00),
                  borderRadius: BorderRadius.circular(
                    context.width(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Pay Now",
                    style: TextStyle(
                      fontSize: context.width(14),
                      fontFamily: fontFamily,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
