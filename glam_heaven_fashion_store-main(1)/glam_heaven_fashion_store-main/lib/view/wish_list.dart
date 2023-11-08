import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glam_heaven_fashion_store/extensions/responsive_extension.dart';
import 'package:glam_heaven_fashion_store/provider/providers.dart';

class Wishlist extends ConsumerWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final edit = ref.watch(editProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'wishlist',
          style: TextStyle(fontFamily: 'FONT1', color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(editProvider.notifier).state =
                  !ref.read(editProvider.notifier).state;
            },
            icon: edit
                ? Icon(
                    CupertinoIcons.pen,
                    color: Colors.black,
                    size: context.width(
                      28,
                    ),
                  )
                : const Icon(
                    CupertinoIcons.delete,
                    color: Colors.grey,
                  ),
          ),
          IconButton(
            onPressed: () {},
            icon: edit
                ? const Icon(
                    CupertinoIcons.cart,
                    color: Colors.black,
                  )
                : const Icon(
                    CupertinoIcons.share,
                    color: Colors.grey,
                  ),
          )
        ],
      ),
      body: GridView.builder(
        itemCount: 20,
        padding: EdgeInsets.all(context.width(
          8,
        )),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1 / 1.5,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0x927C7878),
                  width: context.width(
                    1,
                  ),
                ),
                borderRadius: BorderRadius.circular(
                  context.width(
                    12,
                  ),
                ),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: const BeveledRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(2),
                                  ),
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: context.width(
                                        350,
                                      ),
                                      height: context.width(
                                        250,
                                      ),
                                      child: PageView(
                                        children: [
                                          Image.asset(
                                            'assets/images/1.jpg',
                                            fit: BoxFit.fill,
                                          ),
                                          Image.asset(
                                            'assets/images/1.jpg',
                                            fit: BoxFit.fill,
                                          )
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      'HERE&NOW Men Black tshirt',
                                      style: TextStyle(
                                        fontFamily: 'FONT1',
                                      ),
                                    ),
                                    const Text(
                                      '₹749',
                                      style: TextStyle(
                                        fontFamily: 'FONT1',
                                      ),
                                    )
                                  ],
                                ),
                                actions: [
                                  const Divider(),
                                  Center(
                                    child: InkWell(
                                      onTap: () {},
                                      child: Text('ADD TO BAG',
                                          style: TextStyle(
                                              fontFamily: 'FONT1',
                                              fontSize: context.width(
                                                15,
                                              ),
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700)),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              context.width(
                                6,
                              ),
                            ),
                            topRight: Radius.circular(
                              context.width(
                                6,
                              ),
                            ),
                          ),
                          child: SizedBox(
                            width: context.width(
                              MediaQuery.of(context).size.width,
                            ),
                            height: context.width(
                              185,
                            ),
                            child: Image.asset(
                              'assets/images/1.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: context.width(
                          135,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: edit
                              ? Icon(
                                  Icons.cancel,
                                  size: context.width(
                                    25,
                                  ),
                                )
                              : CircleAvatar(
                                  radius: context.width(
                                    10,
                                  ),
                                ),
                          color: const Color(0xCAFFFFFF),
                        ),
                      ),
                      Positioned(
                        bottom: context.width(
                          5,
                        ),
                        left: context.width(
                          5,
                        ),
                        child: Container(
                          width: context.width(
                            89,
                          ),
                          height: context.width(
                            27,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color.fromARGB(166, 255, 255, 255),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '4.2',
                                style: TextStyle(
                                  fontFamily: 'FONT1',
                                  fontWeight: FontWeight.w900,
                                  fontSize: context.width(
                                    13,
                                  ),
                                ),
                              ),
                              Icon(
                                CupertinoIcons.star_fill,
                                size: context.width(
                                  12,
                                ),
                                color: const Color.fromARGB(255, 16, 157, 18),
                              ),
                              Text(
                                '|',
                                style: TextStyle(
                                    fontFamily: 'FONT1',
                                    fontWeight: FontWeight.w900,
                                    fontSize: context.width(
                                      20,
                                    )),
                              ),
                              Text(
                                '1.0k',
                                style: TextStyle(
                                  fontFamily: 'FONT1',
                                  fontWeight: FontWeight.w900,
                                  fontSize: context.width(
                                    13,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: context.width(
                          70,
                        ),
                        top: 15),
                    child: const Text(
                      'HERE&NOW',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'FONT1',
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: context.width(
                        128,
                      ),
                    ),
                    child: Text(
                      '₹ 749',
                      style: TextStyle(
                          fontFamily: 'FONT1',
                          fontWeight: FontWeight.w900,
                          fontSize: context.width(
                            10,
                          )),
                    ),
                  ),
                  const Divider(),
                  Center(
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        'Move To Bag',
                        style: TextStyle(
                            fontFamily: 'FONT1',
                            // fontSize: context.width(15, context),
                            // fontSize: context.width(50),
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
