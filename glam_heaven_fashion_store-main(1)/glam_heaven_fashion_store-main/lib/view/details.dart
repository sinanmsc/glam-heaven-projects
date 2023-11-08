import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glam_heaven_fashion_store/extensions/responsive_extension.dart';

import '../provider/details_provider.dart';

class Details extends ConsumerWidget {
  Details({super.key});

  final controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final circle = ref.watch(circleProvider);
    final read = ref.watch(readProvider);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: context.width(300),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 219, 216, 216)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: context.width(30),
                        ),
                        Center(
                          child: SizedBox(
                            height: context.width(190),
                            width: MediaQuery.of(context).size.width,
                            child: PageView(
                              controller: controller,
                              onPageChanged: (value) {
                                ref.watch(pageviewProvider.notifier).state =
                                    value;
                              },
                              children: [
                                Image.asset(
                                  'assets/images/pants-transparent-background-16.png',
                                  fit: BoxFit.contain,
                                ),
                                Image.asset(
                                  'assets/images/pants-transparent-background-16.png',
                                  fit: BoxFit.contain,
                                ),
                                Image.asset(
                                  'assets/images/pants-transparent-background-16.png',
                                  fit: BoxFit.contain,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: context.width(4),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.animateToPage(0,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.linear);
                              },
                              child: container1(
                                selected: ref.watch(pageviewProvider) == 0
                                    ? true
                                    : false,
                                pic: Image.asset(
                                  'assets/images/pants-transparent-background-16.png',
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: context.width(10),
                            ),
                            InkWell(
                              onTap: () {
                                controller.animateToPage(1,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.linear);
                              },
                              child: container1(
                                selected: ref.watch(pageviewProvider) == 1
                                    ? true
                                    : false,
                                pic: Image.asset(
                                  'assets/images/pants-transparent-background-16.png',
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: context.width(10),
                            ),
                            InkWell(
                              onTap: () {
                                controller.animateToPage(2,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.linear);
                              },
                              child: container1(
                                selected: ref.watch(pageviewProvider) == 2
                                    ? true
                                    : false,
                                pic: Image.asset(
                                  'assets/images/pants-transparent-background-16.png',
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: context.width(20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      top: context.width(20),
                      left: context.width(20),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: context.width(24),
                          color: Colors.black,
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: context.width(15),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: context.width(20), right: context.width(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fit Jean',
                      style: TextStyle(
                          // fontFamily: 'comfort',
                          fontSize: context.width(34),
                          fontWeight: FontWeight.w700),
                    ),
                    Container(
                      height: context.width(30),
                      width: context.width(70),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.yellow[200]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow[700],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: context.width(3)),
                            child: Text(
                              '4.3',
                              style: TextStyle(
                                  fontSize: context.width(17),
                                  fontWeight: FontWeight.w600,
                                  color: Colors.yellow[700]),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: context.width(6),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: context.width(20), right: context.width(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$25',
                      style: TextStyle(
                          // fontFamily: 'comfort',
                          fontSize: context.width(28),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: context.width(15),
              ),
              SizedBox(
                  width: context.width(324),
                  child: Text(
                    'The simple jean ever which on wearing will make you feel the most comfort also it is the most stylish jean available on the market today.',
                    maxLines: read ? 2 : null,
                    style: TextStyle(

                        // fontFamily: 'comfort',
                        fontSize: context.width(18),
                        color: Color.fromARGB(255, 156, 153, 153),
                        fontWeight: FontWeight.w400),
                  )),
              Padding(
                padding: EdgeInsets.only(right: context.width(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          ref.read(readProvider.notifier).state =
                              !ref.read(readProvider.notifier).state;
                        },
                        child: Text(
                          read ? 'Read More' : 'Read Less',
                          style: TextStyle(
                              fontSize: context.width(18),
                              color: Color.fromARGB(255, 20, 27, 130)),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: context.width(20), right: context.width(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'size',
                      style: TextStyle(
                          // fontFamily: 'comfort',
                          fontSize: context.width(28),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: context.width(10),
              ),
              Padding(
                padding: EdgeInsets.only(left: context.width(30)),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        ref.read(circleProvider.notifier).state = 0;
                        // circle == 0;
                      },
                      child: circleavatar1(
                        text: '28',
                        color: circle == 0 ? Colors.white : Colors.black,
                        color1: circle == 0
                            ? Color.fromARGB(255, 20, 27, 130)
                            : const Color.fromARGB(255, 219, 216, 216),
                      ),
                    ),
                    SizedBox(
                      width: context.width(10),
                    ),
                    InkWell(
                      onTap: () {
                        ref.read(circleProvider.notifier).state = 1;
                      },
                      child: circleavatar1(
                        text: '30',
                        color: circle == 1 ? Colors.white : Colors.black,
                        color1: circle == 1
                            ? Color.fromARGB(255, 20, 27, 130)
                            : const Color.fromARGB(255, 219, 216, 216),
                      ),
                    ),
                    SizedBox(
                      width: context.width(10),
                    ),
                    InkWell(
                      onTap: () {
                        ref.read(circleProvider.notifier).state = 2;
                      },
                      child: circleavatar1(
                        text: '32',
                        color: circle == 2 ? Colors.white : Colors.black,
                        color1: circle == 2
                            ? Color.fromARGB(255, 20, 27, 130)
                            : const Color.fromARGB(255, 219, 216, 216),
                      ),
                    ),
                    SizedBox(
                      width: context.width(10),
                    ),
                    InkWell(
                      onTap: () {
                        ref.read(circleProvider.notifier).state = 3;
                      },
                      child: circleavatar1(
                        text: '34',
                        color: circle == 3 ? Colors.white : Colors.black,
                        color1: circle == 3
                            ? Color.fromARGB(255, 20, 27, 130)
                            : const Color.fromARGB(255, 219, 216, 216),
                      ),
                    ),
                    SizedBox(
                      width: context.width(10),
                    ),
                    InkWell(
                      onTap: () {
                        ref.read(circleProvider.notifier).state = 4;
                      },
                      child: circleavatar1(
                        text: '36',
                        color: circle == 4 ? Colors.white : Colors.black,
                        color1: circle == 4
                            ? Color.fromARGB(255, 20, 27, 130)
                            : const Color.fromARGB(255, 219, 216, 216),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: context.width(15),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: context.width(20), right: context.width(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Similar products',
                      style: TextStyle(
                          // fontFamily: 'comfort',
                          fontSize: context.width(28),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: context.width(15),
              ),
              SizedBox(
                height: context.width(250),
                child: Padding(
                  padding: EdgeInsets.only(left: context.width(20)),
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          width: context.width(140),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 20, 27, 130)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: context.width(98),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/pants-transparent-background-16.png')),
                                    color: const Color.fromARGB(
                                        255, 219, 216, 216)),
                              ),
                              SizedBox(
                                height: context.width(6),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: context.width(15)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Stylo',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: context.width(20)),
                                    ),
                                    SizedBox(
                                      height: context.width(5),
                                    ),
                                    Text(
                                      'Men slim mid...',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: context.width(16)),
                                    ),
                                    SizedBox(
                                      height: context.width(5),
                                    ),
                                    Text(
                                      '\$27',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: context.width(20)),
                                    ),
                                    SizedBox(
                                      height: context.width(5),
                                    ),
                                    Text(
                                      '46% off',
                                      style: TextStyle(
                                          color: Colors.yellow,
                                          fontWeight: FontWeight.w600,
                                          fontSize: context.width(18)),
                                    ),
                                    SizedBox(
                                      height: context.width(5),
                                    ),
                                    Text(
                                      'Free Delivery',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: context.width(18)),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            width: context.width(10),
                          ),
                      itemCount: 4),
                ),
              ),
              SizedBox(
                height: context.width(15),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: context.width(60),
            width: MediaQuery.of(context).size.width / 2,
            color: Colors.yellow[700],
            child: Text(
              'Add to cart',
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: context.width(22)),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: context.width(60),
            width: MediaQuery.of(context).size.width / 2,
            color: Color.fromARGB(255, 20, 27, 130),
            child: Text(
              'Buy Now',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: context.width(22)),
            ),
          ),
        ],
      ),
    );
  }
}

class circleavatar1 extends StatelessWidget {
  const circleavatar1(
      {super.key,
      required this.text,
      required this.color,
      required this.color1});
  final String text;
  final Color color;
  final Color color1;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: context.width(18),
            color: color),
      ),
      radius: context.width(24),
      backgroundColor: color1,
    );
  }
}

class container1 extends StatelessWidget {
  const container1({
    super.key,
    required this.pic,
    required this.selected,
  });
  final Image pic;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: context.width(50),
      width: context.width(50),
      decoration: BoxDecoration(
          border: Border.all(
              width: 1.5,
              style: selected ? BorderStyle.solid : BorderStyle.none,
              color: Color.fromARGB(255, 138, 135, 135),
              strokeAlign: BorderSide.strokeAlignInside),
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 239, 238, 238)),
      child: pic,
    );
  }
}
