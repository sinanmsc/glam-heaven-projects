import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glam_heaven_fashion_store/components/dont_use.dart';
import 'package:glam_heaven_fashion_store/extensions/responsive_extension.dart';
import 'package:glam_heaven_fashion_store/provider/providers.dart';

class WomensCtegory extends ConsumerWidget {
  const WomensCtegory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toggle = ref.watch(toggleprovider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const Heightbetween(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.width(32),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        size: context.width(24),
                      ),
                      const Widthbetween(
                        width: 10,
                      ),
                      SizedBox(
                        width: context.width(140),
                        child: Text(
                          "Women's Category",
                          style: TextStyle(
                              fontFamily: "Camforta",
                              fontSize: context.width(26),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Widthbetween(width: 80),
                      SizedBox(
                        height: context.width(50),
                        width: context.width(50),
                        child: Image.asset(
                          "assets/images/Basket_alt_3_light.png",
                          color: Colors.black,
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
                  ),
                ),
                const Heightbetween(height: 40),
                SizedBox(
                  height: context.width(56),
                  width: context.width(292),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFF9F7F7),
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: context.width(18),
                          fontFamily: "Camforta"),
                      hintText: "     Search",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          context.width(14),
                        ),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: context.width(1.7),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          context.width(14),
                        ),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: context.width(1.7),
                        ),
                      ),
                    ),
                  ),
                ),
                const Heightbetween(height: 39),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: context.width(
                    589,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEDEDED),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        context.width(
                          40,
                        ),
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Heightbetween(height: 32),
                      SizedBox(
                        height: context.width(
                          150,
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 2,
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(
                                left: context.width(
                              40,
                            )),
                            child: Container(
                              width: context.width(
                                260,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.cyanAccent,
                                borderRadius: BorderRadius.circular(
                                  context.width(
                                    10,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Heightbetween(height: 20),
                      SizedBox(
                        height: context.width(
                          20,
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              const Widthbetween(width: 20),
                              InkWell(
                                onTap: () {
                                  ref.read(toggleprovider.notifier).state = 1;
                                },
                                child: CategoryText(
                                  text1: "All",
                                  fontweight1: toggle == 1
                                      ? FontWeight.w700
                                      : FontWeight.w500,
                                ),
                              ),
                              const Widthbetween(width: 18),
                              InkWell(
                                onTap: () {
                                  ref.read(toggleprovider.notifier).state = 2;
                                },
                                child: CategoryText(
                                    text1: "Kurtis",
                                    fontweight1: toggle == 2
                                        ? FontWeight.w700
                                        : FontWeight.w500),
                              ),
                              const Widthbetween(width: 18),
                              InkWell(
                                onTap: () {
                                  ref.read(toggleprovider.notifier).state = 3;
                                },
                                child: CategoryText(
                                    text1: "Sarees",
                                    fontweight1: toggle == 3
                                        ? FontWeight.w700
                                        : FontWeight.w500),
                              ),
                              const Widthbetween(width: 18),
                              InkWell(
                                onTap: () {
                                  ref.read(toggleprovider.notifier).state = 4;
                                },
                                child: CategoryText(
                                    text1: "Shirts",
                                    fontweight1: toggle == 4
                                        ? FontWeight.w700
                                        : FontWeight.w500),
                              ),
                              const Widthbetween(width: 18),
                              InkWell(
                                onTap: () {
                                  ref.read(toggleprovider.notifier).state = 5;
                                },
                                child: CategoryText(
                                    text1: "Hoodies",
                                    fontweight1: toggle == 5
                                        ? FontWeight.w700
                                        : FontWeight.w500),
                              ),
                              const Widthbetween(width: 18),
                              InkWell(
                                onTap: () {
                                  ref.read(toggleprovider.notifier).state = 6;
                                },
                                child: CategoryText(
                                    text1: "Jeans",
                                    fontweight1: toggle == 6
                                        ? FontWeight.w700
                                        : FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Heightbetween(height: 20),
                      SizedBox(
                        height: context.width(347),
                        width: MediaQuery.of(context).size.width,
                        child: GridView.builder(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.width(
                              30,
                            ),
                          ),
                          itemCount: 6,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: context.width(216),
                                  mainAxisSpacing: context.width(18),
                                  crossAxisSpacing: context.width(20),
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(36, 0, 0, 0),
                                  blurRadius: context.width(20),
                                )
                              ],
                              borderRadius: BorderRadius.circular(
                                context.width(8),
                              ),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                const Heightbetween(height: 10),
                                Container(
                                  height: context.width(140),
                                  width: context.width(130),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      context.width(6),
                                    ),
                                    color: const Color(0xFFEDEDED),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          right: context.width(10),
                                          top: context.width(5),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              height: context.width(32),
                                              width: context.width(32),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  context.width(20),
                                                ),
                                                border: Border.all(
                                                    width: context.width(1.5),
                                                    color: Colors.black),
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.favorite_border,
                                                  color: Colors.black,
                                                  size: context.width(22),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: context.width(100),
                                        width: context.width(104),
                                        child: Image.asset(
                                          "assets/images/Rectangle 6522.png",
                                          fit: BoxFit.contain,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: context.width(6),
                                    left: context.width(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Red flower kurta",
                                        style: TextStyle(
                                            fontSize: context.width(13.5),
                                            fontFamily: 'Camforta'),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: context.width(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star_border_rounded,
                                        color:
                                            Color.fromARGB(255, 247, 226, 39),
                                        size: context.width(22),
                                      ),
                                      Text(
                                        "4.5",
                                        style: TextStyle(
                                            fontSize: context.width(13.5),
                                            fontFamily: 'Camforta'),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: context.width(
                                      10,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Rs 1200",
                                        style: TextStyle(
                                            fontSize: context.width(
                                              13.5,
                                            ),
                                            fontFamily: 'Camforta'),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
