import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glam_heaven_fashion_store/extensions/responsive_extension.dart';

import '../provider/providers.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.profile_circled,
                color: Colors.black,
              ))
        ],
        leading: SizedBox(
          width: context.width(30),
        ),
        title: const Text(
          "Glame heaven",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: context.width(12),
            ),
            CarouselSlider.builder(
                itemCount: 5,
                itemBuilder: (context, index, realIndex) => Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: context.width(10)),
                      child: Container(
                        height: context.width(180),
                        width: context.width(390),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromARGB(255, 95, 86, 61),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://media.ourfashionpassion.com/wp-content/uploads/2022/10/07104132/AW22-Street-Style-Trends.jpeg"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                options: CarouselOptions(
                  autoPlay: true,
                )),
            SizedBox(
              height: context.width(12),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width(10)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        hintText: "search bag",
                        floatingLabelAlignment: FloatingLabelAlignment.center,
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                              left: context.width(20),
                              right: context.width(10)),
                          child: const Icon(Icons.search_rounded),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(56)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(46),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.width(22),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: context.width(10),
                      ),
                      InkWell(
                        onTap: () {
                          ref.read(brandContainerProvider.notifier).state = 0;
                        },
                        child: BrandnameContainer(
                          brandname: "ARMANI",
                          containerColor: ref.watch(brandContainerProvider) == 0
                              ? const Color.fromARGB(255, 0, 0, 0)
                              : const Color(0xffD9D9D9),
                          textcolor: ref.watch(brandContainerProvider) == 0
                              ? const Color(0xffD9D9D9)
                              : Colors.black,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          ref.read(brandContainerProvider.notifier).state = 1;
                        },
                        child: BrandnameContainer(
                          brandname: "GUCCI",
                          containerColor: ref.watch(brandContainerProvider) == 1
                              ? const Color(0xff0E0E0E)
                              : const Color(0xffD9D9D9),
                          textcolor: ref.watch(brandContainerProvider) == 1
                              ? const Color(0xffD9D9D9)
                              : Colors.black,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          ref.read(brandContainerProvider.notifier).state = 2;
                        },
                        child: BrandnameContainer(
                          brandname: "PRADA",
                          containerColor: ref.watch(brandContainerProvider) == 2
                              ? const Color(0xff0E0E0E)
                              : const Color(0xffD9D9D9),
                          textcolor: ref.watch(brandContainerProvider) == 2
                              ? const Color(0xffD9D9D9)
                              : Colors.black,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          ref.read(brandContainerProvider.notifier).state = 3;
                        },
                        child: BrandnameContainer(
                          brandname: "CHANNEL",
                          containerColor: ref.watch(brandContainerProvider) == 3
                              ? const Color(0xff0E0E0E)
                              : const Color(0xffD9D9D9),
                          textcolor: ref.watch(brandContainerProvider) == 3
                              ? const Color(0xffD9D9D9)
                              : Colors.black,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          ref.read(brandContainerProvider.notifier).state = 4;
                        },
                        child: BrandnameContainer(
                          brandname: "BOSS",
                          containerColor: ref.watch(brandContainerProvider) == 4
                              ? const Color(0xff0E0E0E)
                              : const Color(0xffD9D9D9),
                          textcolor: ref.watch(brandContainerProvider) == 4
                              ? const Color(0xffD9D9D9)
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.width(22),
                  ),
                  Row(
                    children: [
                      Text(
                        "Best selling",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: context.width(20),
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: context.width(170),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: context.width(
                              18,
                            ),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.width(
                      10,
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: context.width(10),
                      crossAxisSpacing: context.width(10),
                      childAspectRatio: 2 / 2.8,
                      crossAxisCount: 2,
                    ),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: context.width(200),
                          width: context.width(165),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 192, 192, 192),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: context.width(6),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: context.width(70),
                                ),
                                child: Container(
                                  height: context.width(20),
                                  width: context.width(50),
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 255, 41, 41),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "30%",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: context.width(10),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        const Color.fromARGB(255, 61, 28, 28),
                                    image: const DecorationImage(
                                        image: NetworkImage(
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvFYI94-hSyTZpg5-3nXAnklcobZ-vLF3seQ&usqp=CAU"),
                                        fit: BoxFit.cover)),
                                height: context.width(150),
                                width: context.width(140),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Prada saddle bag",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: context.width(16)),
                            ),
                            SizedBox(
                              width: context.width(10),
                            ),
                            const Icon(Icons.favorite_border),
                          ],
                        ),
                        const Text(
                          textAlign: TextAlign.start,
                          "\$120,000",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: context.height(5),
                  // ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Todays deal",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: context.width(20),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: context.height(12),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: context.width(200),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemExtent: context.width(380),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Container(
                          height: context.width(40),
                          width: context.width(50),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://assets.indiadesire.com/images/Amazon%20Footwear%20Offer%202021.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.height(20),
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Most wanted",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: context.width(20),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: context.height(5)),
                  SizedBox(
                    height: context.height(260),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 3,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      itemBuilder: (context, index) {
                        return Container(
                            height: context.width(213),
                            width: context.width(153),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 162, 162, 162),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: Offset(1, 3),
                                )
                              ],
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: context.height(10),
                                ),
                                Center(
                                  child: Container(
                                    height: context.height(144),
                                    width: context.width(134),
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: NetworkImage(
                                                "https://assets.ajio.com/medias/sys_master/root/20230602/Dtgx/64795c65d55b7d0c633c778c/-1117Wx1400H-462323964-white-MODEL.jpg")),
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255)),
                                  ),
                                ),
                                SizedBox(
                                  height: context.height(5),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: context.width(10)),
                                  child: Column(
                                    children: [
                                      Text(
                                        "pattern shirt",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: context.width(12),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: context.width(8)),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.star_border_sharp),
                                      Text(
                                        "4.2",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: context.width(10)),
                                      child: const Text(
                                        "RS 1200",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ));
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: context.width(10),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: context.width(10),
                  ),
                  SizedBox(
                    height: context.height(260),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 3,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      itemBuilder: (context, index) {
                        return Container(
                            height: context.width(213),
                            width: context.width(153),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 126, 126, 126),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset: Offset(1, 3),
                                )
                              ],
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: context.height(10),
                                ),
                                Center(
                                  child: Container(
                                    height: context.height(144),
                                    width: context.width(134),
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                            image: NetworkImage(
                                                "https://assets.ajio.com/medias/sys_master/root/20230602/Dtgx/64795c65d55b7d0c633c778c/-1117Wx1400H-462323964-white-MODEL.jpg")),
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255)),
                                  ),
                                ),
                                SizedBox(
                                  height: context.height(5),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: context.width(10)),
                                  child: Column(
                                    children: [
                                      Text(
                                        "pattern shirt",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: context.width(12),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: context.width(8)),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.star_border_sharp),
                                      Text(
                                        "4.2",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: context.width(10)),
                                      child: const Text(
                                        "RS 1200",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ));
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: context.width(10),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: context.width(10),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Discover latest",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: context.width(20),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: context.width(10),
                  ),
                  Container(
                    height: context.width(200),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Colors.amber,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZmFzaGlvbnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80"),
                            fit: BoxFit.cover)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: context.width(20),
            ),
          ],
        ),
      ),
    );
  }
}

class BrandnameContainer extends StatelessWidget {
  const BrandnameContainer(
      {super.key,
      required this.containerColor,
      required this.brandname,
      required this.textcolor});
  final Color containerColor;
  final String brandname;
  final Color textcolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(64),
      height: context.width(39),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: containerColor,
      ),
      child: Center(
        child: Text(
          brandname,
          style: TextStyle(
              fontSize: context.width(12),
              fontWeight: FontWeight.w800,
              color: textcolor),
        ),
      ),
    );
  }
}
