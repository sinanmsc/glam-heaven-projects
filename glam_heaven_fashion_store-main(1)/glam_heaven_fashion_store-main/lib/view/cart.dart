import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glam_heaven_fashion_store/extensions/responsive_extension.dart';
import 'package:glam_heaven_fashion_store/provider/providers.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  final String fontfamily = "Comfortaa";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.arrow_left,
            size: context.width(25),
          ),
        ),
        title: Text(
          "My Cart",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: fontfamily,
            fontSize: context.width(20),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.shopping_cart,
              size: context.width(25),
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => Row(
                children: [
                  IconButton(
                    onPressed: () {
                      ref.read(checkprovider.notifier).state =
                          !ref.read(checkprovider.notifier).state;
                    },
                    icon: ref.watch(checkprovider)
                        ? Icon(Icons.check_circle_outline)
                        : Icon(Icons.circle_outlined),
                  ),
                  Container(
                    width: context.width(136),
                    height: context.width(108),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          context.width(10),
                        ),
                        image: DecorationImage(
                            image: AssetImage("assets/images/Rectangle 58.png"),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: context.width(10),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nike Boys Polyester\nT shirt",
                        style: TextStyle(fontSize: context.width(16)),
                      ),
                      SizedBox(
                        height: context.width(10),
                      ),
                      Text("\$629"),
                      SizedBox(
                        height: context.width(10),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: context.width(60),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    ref.read(counterprovider.notifier).state--;
                                  },
                                  borderRadius:
                                      BorderRadius.circular(context.width(20)),
                                  child: Icon(
                                    Icons.remove_circle_outline,
                                    color: Colors.black45,
                                  ),
                                ),
                                Text(
                                  "${ref.watch(counterprovider)}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                InkWell(
                                  onTap: () {
                                    ref.read(counterprovider.notifier).state++;
                                  },
                                  borderRadius:
                                      BorderRadius.circular(context.width(20)),
                                  child: Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.black45,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: context.width(30),
                          ),
                          Container(
                            width: context.width(50),
                            height: context.width(20),
                            decoration: BoxDecoration(
                              color: Color(0xff47E590),
                              borderRadius: BorderRadius.circular(
                                context.width(5),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Buy",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
          separatorBuilder: (context, index) => Column(
                children: [
                  SizedBox(
                    height: context.width(20),
                  ),
                  Divider(
                    thickness: context.width(0.5),
                  ),
                  SizedBox(
                    height: context.width(20),
                  ),
                ],
              ),
          itemCount: 20),
      bottomSheet: Container(
        height: context.width(80),
        decoration: BoxDecoration(
          color: Color(0xff2B1D63),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              context.width(20),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "\$989",
              style:
                  TextStyle(color: Colors.white, fontSize: context.width(20)),
            ),
            Container(
              width: context.width(140),
              height: context.width(40),
              decoration: BoxDecoration(
                color: Color(0xffE39247),
                borderRadius: BorderRadius.circular(
                  context.width(10),
                ),
              ),
              child: Center(
                child: Text(
                  "Place Order",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
