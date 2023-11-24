import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glam_heaven_fashion_store/extensions/responsive_extension.dart';

import '../provider/details_provider.dart';

class Details extends ConsumerWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> data;
  Details({super.key, required this.data});

  final controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final circle = ref.watch(circleProvider);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                      padding: EdgeInsets.all(context.width(10)),
                      height: context.width(300),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 219, 216, 216)),
                      child: Image.network(data.data()['image'])),
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
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: context.width(280),
                          child: Text(
                            data.data()['name'],
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: context.width(21),
                                fontWeight: FontWeight.w700),
                          ),
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
                              Text(
                                data.data()['totalRating'].toString(),
                                style: TextStyle(
                                    fontSize: context.width(17),
                                    fontWeight: FontWeight.w600,
                                    color: Colors.yellow[700]),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: context.width(6),
                    ),
                    Row(
                      children: [
                        Stack(
                          children: [
                            Text(
                              '\$${data.data()['price']} ',
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: context.width(25),
                                  fontWeight: FontWeight.w600),
                            ),
                            Positioned(
                              left: 20,
                              child: Image.asset(
                                'assets/x.png',
                                width: 42,
                              ),
                            )
                          ],
                        ),
                        Text(
                          '\$${data.data()['discountPrice']} ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: context.width(28),
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.width(15),
                    ),
                    Text(
                      data.data()['discription'],
                      style: TextStyle(
                          fontSize: context.width(17),
                          color: const Color.fromARGB(255, 156, 153, 153),
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: context.width(15)),
                    
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'size',
                          style: TextStyle(
                            fontSize: context.width(28),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: context.height(60),
                          width: context.width(300),
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: data.data()['size'].length,
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: context.width(10)),
                              itemBuilder: (context, index) {
                                final listOfSize = data.data()['size'];
                                return InkWell(
                                  onTap: () {
                                    ref.read(circleProvider.notifier).state =
                                        index;
                                  },
                                  child: Circleavatar1(
                                    text: listOfSize[index],
                                    color: circle == index
                                        ? Colors.white
                                        : Colors.black,
                                    color1: circle == index
                                        ? const Color.fromARGB(255, 20, 27, 130)
                                        : const Color.fromARGB(
                                            255, 219, 216, 216),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.width(5),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: context.width(15)),
                child: Column(
                  children: [
                    Row(
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
                    SizedBox(
                      height: context.width(15),
                    ),
                    SizedBox(
                      height: context.width(250),
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              width: context.width(140),
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 20, 27, 130)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: context.width(98),
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/google.png')),
                                        color:
                                            Color.fromARGB(255, 219, 216, 216)),
                                  ),
                                  SizedBox(
                                    height: context.width(6),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: context.width(15)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                    SizedBox(
                      height: context.width(15),
                    ),
                  ],
                ),
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
            color: const Color.fromARGB(255, 20, 27, 130),
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

class Circleavatar1 extends StatelessWidget {
  const Circleavatar1(
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
      radius: context.width(24),
      backgroundColor: color1,
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: context.width(18),
            color: color),
      ),
    );
  }
}
