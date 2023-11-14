import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glam_heaven_fashion_store/components/filter-custom.dart';
import 'package:glam_heaven_fashion_store/components/order_ink.dart';
import 'package:glam_heaven_fashion_store/extensions/responsive_extension.dart';
import 'package:glam_heaven_fashion_store/provider/providers.dart';

class Orderpage extends ConsumerWidget {
  Orderpage({super.key});
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Orders',
          style: TextStyle(fontFamily: 'FONT1', color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: context.width(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: context.width(
                    250,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(CupertinoIcons.search),
                      hintText: 'Search in orders',
                      hintStyle: const TextStyle(fontFamily: "fONT1"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: context.width(
                        15,
                      )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            context.width(
                              10,
                            ),
                          ),
                          borderSide: BorderSide.none),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          context.width(
                            10,
                          ),
                        ),
                      ),
                    ),
                    style: const TextStyle(color: Colors.green),
                  ),
                ),
                SizedBox(
                  height: context.width(
                    45,
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              context.width(
                                8,
                              ),
                            ),
                            side: const BorderSide(color: Colors.grey)),
                      ),
                    ),
                    onPressed: () {
                      scaffoldKey.currentState!.showBottomSheet(
                        (context) => Consumer(
                          builder: (context, ref, _) {
                            final colorpr = ref.watch(filterProvider);

                            return SizedBox(
                              height: context.width(620),
                              child: Padding(
                                padding: EdgeInsets.all(context.width(20)),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Filter Orders',
                                          style: TextStyle(
                                              fontSize: context.width(15),
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w700),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(
                                            CupertinoIcons.xmark,
                                            size: context.width(14),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: context.width(34),
                                    ),
                                    Text(
                                      'Status',
                                      style: TextStyle(
                                          fontSize: context.width(15),
                                          fontFamily: 'Comfortaa',
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: context.width(34),
                                    ),
                                    FilterCustom(
                                      text: 'All',
                                      ontap: () {
                                        ref
                                            .read(filterProvider.notifier)
                                            .state = 1;
                                        log("1");
                                      },
                                      colorr: colorpr == 1
                                          ? Colors.green
                                          : const Color(0xffD9D9D9),
                                      selected: colorpr == 1,
                                    ),
                                    SizedBox(
                                      height: context.width(10),
                                    ),
                                    FilterCustom(
                                      text: 'On the Way',
                                      ontap: () {
                                        ref
                                            .read(filterProvider.notifier)
                                            .state = 2;
                                      },
                                      colorr: colorpr == 2
                                          ? Colors.green
                                          : const Color(0xffD9D9D9),
                                      selected: colorpr == 2,
                                    ),
                                    SizedBox(
                                      height: context.width(10),
                                    ),
                                    FilterCustom(
                                      text: 'Delivered',
                                      ontap: () {
                                        ref
                                            .read(filterProvider.notifier)
                                            .state = 3;
                                      },
                                      colorr: colorpr == 3
                                          ? Colors.green
                                          : const Color(0xffD9D9D9),
                                      selected: colorpr == 3,
                                    ),
                                    SizedBox(
                                      height: context.width(10),
                                    ),
                                    FilterCustom(
                                        selected: colorpr == 4,
                                        text: 'Cancelled',
                                        ontap: () {
                                          ref
                                              .read(filterProvider.notifier)
                                              .state = 4;
                                        },
                                        colorr: colorpr == 4
                                            ? Colors.green
                                            : const Color(0xffD9D9D9)),
                                    SizedBox(
                                      height: context.width(10),
                                    ),
                                    FilterCustom(
                                      selected: colorpr == 5,
                                      text: 'Returned',
                                      ontap: () {
                                        ref
                                            .read(filterProvider.notifier)
                                            .state = 5;
                                      },
                                      colorr: colorpr == 5
                                          ? Colors.green
                                          : const Color(0xffD9D9D9),
                                    ),
                                    SizedBox(
                                      height: context.width(62),
                                    ),
                                    Divider(
                                      thickness: context.width(1),
                                    ),
                                    SizedBox(
                                      height: context.width(10),
                                    ),
                                    Text(
                                      'Time',
                                      style: TextStyle(
                                          fontSize: context.width(15),
                                          fontFamily: 'Comfortaa',
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: context.width(34),
                                    ),
                                    FilterCustom(
                                        selected: colorpr == 6,
                                        text: 'Anytime',
                                        ontap: () {
                                          ref
                                              .read(filterProvider.notifier)
                                              .state = 6;
                                        },
                                        colorr: colorpr == 6
                                            ? Colors.green
                                            : const Color(0xffD9D9D9)),
                                    SizedBox(
                                      height: context.width(10),
                                    ),
                                    FilterCustom(
                                        selected: colorpr == 7,
                                        text: 'Last 30 days',
                                        ontap: () {
                                          ref
                                              .read(filterProvider.notifier)
                                              .state = 7;
                                        },
                                        colorr: colorpr == 7
                                            ? Colors.green
                                            : const Color(0xffD9D9D9)),
                                    SizedBox(
                                      height: context.width(10),
                                    ),
                                    FilterCustom(
                                        selected: colorpr == 8,
                                        text: 'Last 6 months',
                                        ontap: () {
                                          ref
                                              .read(filterProvider.notifier)
                                              .state = 8;
                                        },
                                        colorr: colorpr == 8
                                            ? Colors.green
                                            : const Color(0xffD9D9D9)),
                                    SizedBox(
                                      height: context.width(10),
                                    ),
                                    FilterCustom(
                                      selected: colorpr == 9,
                                      text: 'Last year',
                                      ontap: () {
                                        ref
                                            .read(filterProvider.notifier)
                                            .state = 9;
                                      },
                                      colorr: colorpr == 9
                                          ? Colors.green
                                          : const Color(0xffD9D9D9),
                                    ),
                                    SizedBox(
                                      height: context.width(10),
                                    ),
                                    Divider(
                                      thickness: context.width(1),
                                    ),
                                    SizedBox(
                                      height: context.width(10),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              shape:
                                                  const ContinuousRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                              ),
                                              backgroundColor: Colors.white),
                                          child: const Text(
                                            'CLEAR FILTERS',
                                            style: TextStyle(
                                                fontFamily: 'Comfortaa',
                                                color: Colors.black,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Apply',
                                            style: TextStyle(
                                                fontFamily: 'inter',
                                                fontSize: context.width(15),
                                                color: Colors.white,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape:
                                                  const ContinuousRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                              ),
                                              backgroundColor: Colors.red),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          CupertinoIcons.slider_horizontal_3,
                          color: Colors.black,
                        ),
                        Text(
                          "Filter",
                          style: TextStyle(
                              fontFamily: 'Comfortaa',
                              color: Colors.black,
                              fontWeight: FontWeight.w900),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: context.width(
                30,
              ),
            ),
            Divider(
              color: const Color(0xffF5F3F3),
              thickness: context.width(
                5,
              ),
            ),
            SizedBox(
              height: context.width(
                30,
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.74,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: context.width(20),
                  );
                },
                // shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: context.width(10),
                          ),
                          const CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Center(
                              child: Icon(
                                CupertinoIcons.cube_box,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.width(8),
                          ),
                          Column(
                            children: [
                              Text(
                                'Delivered',
                                style: TextStyle(
                                    fontSize: context.width(
                                      17,
                                    ),
                                    fontFamily: 'FONT1',
                                    color: const Color(0xff217902),
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '  on Thu,31 Aug',
                                style: TextStyle(
                                    fontSize: context.width(
                                      12,
                                    ),
                                    fontFamily: 'FONT1',
                                    color: const Color(0xffBAB5B5),
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: context.width(20),
                      ),
                      Container(
                        width: context.width(345),
                        height: context.width(200),
                        decoration: const BoxDecoration(
                          color: Color(0xffF5F2F2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: context.width(18),
                                top: context.width(8),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: context.width(50),
                                    height: context.height(70),
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                      image: DecorationImage(
                                          image:
                                              AssetImage('assets/images/1.jpg'),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  SizedBox(
                                    width: context.width(25),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'HERE&NOW',
                                        style: TextStyle(
                                            fontSize: context.width(14),
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        'women Navy Blue',
                                        style: TextStyle(
                                            color: const Color(0xff625B5B),
                                            fontSize: context.width(12),
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        'size:38',
                                        style: TextStyle(
                                            color: const Color(0xff625B5B),
                                            fontSize: context.width(12),
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      CupertinoIcons.right_chevron,
                                      size: context.width(25),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: context.width(24),
                            ),
                            SizedBox(
                              height: context.width(20),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Orderink(
                                  onTap: () {},
                                  text: 'Style exchange',
                                ),
                                Orderink(
                                  onTap: () {},
                                  text: 'Size exchange',
                                ),
                                Orderink(
                                  onTap: () {},
                                  text: 'Return',
                                ),
                              ],
                            ),
                            const Divider(
                              color: Colors.white,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                  backgroundColor: const Color(0xff139807),
                                  radius: context.width(8),
                                ),
                                const Text(
                                    'Exchange/Return available till 14 Sep')
                              ],
                            ),
                            const Divider(
                              color: Colors.white,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: context.width(20),
                                ),
                                const Text(
                                  'Rate Product',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff625B5B)),
                                ),
                                SizedBox(
                                  width: context.width(10),
                                ),
                                RatingBar.builder(
                                  itemSize: context.width(25),
                                  initialRating: 0,
                                  minRating: 0,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding: EdgeInsets.symmetric(
                                    horizontal: context.width(4),
                                  ),
                                  itemBuilder: (context, _) => const Icon(
                                    CupertinoIcons.star_fill,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: context.width(25),
                      ),
                      Divider(
                        color: const Color(0xffE5E1E1),
                        thickness: context.width(11),
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
