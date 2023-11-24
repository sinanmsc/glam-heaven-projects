import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glam_heaven_fashion_store/components/gridview_container.dart';
import 'package:glam_heaven_fashion_store/components/listview_by_type.dart';
import 'package:glam_heaven_fashion_store/extensions/responsive_extension.dart';
import 'package:glam_heaven_fashion_store/provider/auth_service_provider.dart';
import 'package:glam_heaven_fashion_store/provider/firestore_provider.dart';
import 'package:glam_heaven_fashion_store/provider/storage_provider.dart';
import 'package:glam_heaven_fashion_store/service/product_firestore.dart';
import 'package:glam_heaven_fashion_store/view/details.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../provider/providers.dart';

class Home extends ConsumerWidget {
  final String uid;
  const Home({super.key, required this.uid});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        leading: InkWell(
          onTap: () {
            scaffoldKey.currentState?.openDrawer();
          },
          child: Consumer(builder: (context, ref, _) {
            return Padding(
              padding: EdgeInsets.all(context.width(10)),
              child: ref.read(profileUrlProvider.notifier).state != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(context.width(1000)),
                      child: Image.network(
                        ref.watch(profileUrlProvider).toString(),
                      ))
                  : CircleAvatar(
                      backgroundColor: Colors.grey[350],
                      child: Text(
                        ref.watch(userNameShortProvider).toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
            );
          }),
        ),
        title: Stack(
          children: [
            Text(
              "Glame Heaven",
              style: TextStyle(
                  fontSize: 24,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..color = const Color.fromARGB(255, 0, 0, 0)
                    ..strokeWidth = context.width(1)),
            ),
            const Text(
              "Glame Heaven",
              style: TextStyle(
                  fontSize: 24, color: Color.fromARGB(109, 63, 62, 62)),
            ),
          ],
        ),
      ),
      drawer: Drawer(
          child: ref.watch(readUserProvider(uid)).when(
                data: (data) {
                  // print('object');
                  Future.delayed(Duration.zero).then((value) => ref
                      .read(profileUrlProvider.notifier)
                      .state = data['imageUrl']);
                  final String nameShort = data['name']
                      .toString()
                      .split(' ')
                      .toList()
                      .map((e) => e.split('').first)
                      .join();
                  Future.delayed(Duration.zero).then((value) => ref
                      .read(userNameShortProvider.notifier)
                      .state = nameShort);

                  return ListView(
                    children: [
                      DrawerHeader(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                data['imageUrl'] != null
                                    ? Container(
                                        width: context.width(80),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          border: Border.all(
                                            width: context.width(3),
                                          ),
                                        ),
                                        child: ClipOval(
                                          child: CachedNetworkImage(
                                            imageUrl: data['imageUrl'],
                                            placeholder: (context, url) =>
                                                Center(
                                                    child: Text(
                                              nameShort,
                                              style: const TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                        ),
                                      )
                                    : CircleAvatar(
                                        radius: 40,
                                        child: Text(
                                          nameShort,
                                          style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                SizedBox(
                                  width: context.width(170),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        data['name'],
                                        style: TextStyle(
                                            fontSize: context.width(18)),
                                      ),
                                      Text(
                                        data['email'],
                                        style: TextStyle(
                                            fontSize: context.width(12)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Divider(
                              height: 55,
                              thickness: context.height(4),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(context.width(10)),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(context.width(100), 50),
                              primary: const Color.fromARGB(214, 255, 255, 255),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: context.width(1)),
                                borderRadius:
                                    BorderRadius.circular(context.width(20)),
                              ),
                            ),
                            onPressed: () async {
                              ref.read(authServiceProvider).logout();
                              await GoogleSignIn().signOut();
                            },
                            child: Row(
                              children: [
                                const Icon(Icons.logout_sharp,
                                    color: Colors.black),
                                SizedBox(width: context.width(20)),
                                Text(
                                  'Log out',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: context.width(20),
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            )),
                      )
                    ],
                  );
                },
                error: (error, stackTrace) => const Text('data'),
                loading: () => const CircularProgressIndicator(),
              )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: context.width(12),
            ),
            ref.watch(readBannerProvider).when(
                  data: (data) {
                    print('object2');
                    return CarouselSlider.builder(
                        itemCount: data.docs.length,
                        itemBuilder: (context, index, realIndex) => ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(context.width(20)),
                              child: CachedNetworkImage(
                                cacheKey: DateTime.now().toString(),
                                imageUrl: data.docs[index].data()["image"],
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 1.90,
                          autoPlayCurve: Curves.easeInOut,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                        ));
                  },
                  error: (error, stackTrace) => Center(
                    child: Text('error:$error'),
                  ),
                  loading: () => const SizedBox(
                      height: 200,
                      child: Center(child: CircularProgressIndicator())),
                ),
            SizedBox(
              height: context.width(12),
            ),
            //search
            Container(
              color: Colors.grey[300],
              width: MediaQuery.sizeOf(context).width,
              height: context.width(60),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  hintText: "Search",
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                        left: context.width(20), right: context.width(10)),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width(10)),
              child: Column(
                children: [
                  SizedBox(
                    height: context.width(22),
                  ),
                  Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Best Selling',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'See All',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              ref.read(brandContainerProvider.notifier).state =
                                  0;
                              ref.read(brandNameProvider.notifier).state =
                                  'Nike';
                            },
                            child: BrandnameContainer(
                              brandname: "Nike",
                              containerColor:
                                  ref.watch(brandContainerProvider) == 0
                                      ? const Color.fromARGB(255, 0, 0, 0)
                                      : const Color(0xffD9D9D9),
                              textcolor: ref.watch(brandContainerProvider) == 0
                                  ? const Color(0xffD9D9D9)
                                  : Colors.black,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              ref.read(brandContainerProvider.notifier).state =
                                  1;
                              ref.read(brandNameProvider.notifier).state =
                                  'Gucci';
                            },
                            child: BrandnameContainer(
                              brandname: "GUCCI",
                              containerColor:
                                  ref.watch(brandContainerProvider) == 1
                                      ? const Color(0xff0E0E0E)
                                      : const Color(0xffD9D9D9),
                              textcolor: ref.watch(brandContainerProvider) == 1
                                  ? const Color(0xffD9D9D9)
                                  : Colors.black,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              ref.read(brandContainerProvider.notifier).state =
                                  2;
                              ref.read(brandNameProvider.notifier).state =
                                  'Prada';
                            },
                            child: BrandnameContainer(
                              brandname: "PRADA",
                              containerColor:
                                  ref.watch(brandContainerProvider) == 2
                                      ? const Color(0xff0E0E0E)
                                      : const Color(0xffD9D9D9),
                              textcolor: ref.watch(brandContainerProvider) == 2
                                  ? const Color(0xffD9D9D9)
                                  : Colors.black,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              ref.read(brandContainerProvider.notifier).state =
                                  3;
                              ref.read(brandNameProvider.notifier).state =
                                  'Adidas';
                            },
                            child: BrandnameContainer(
                              brandname: "ADIDAS",
                              containerColor:
                                  ref.watch(brandContainerProvider) == 3
                                      ? const Color(0xff0E0E0E)
                                      : const Color(0xffD9D9D9),
                              textcolor: ref.watch(brandContainerProvider) == 3
                                  ? const Color(0xffD9D9D9)
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: context.width(22),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FutureBuilder(
                            future: GlameProducts.readProducts(
                                'brand', ref.watch(brandNameProvider)),
                            builder: (context, snapshot) {
                              final data = snapshot.data;
                              return SizedBox(
                                height: context.width(500),
                                child: GridView.builder(
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: context.width(10),
                                      crossAxisSpacing: context.width(10),
                                      childAspectRatio: 4 / 2.9,
                                      crossAxisCount: 2,
                                    ),
                                    physics: const ScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 4,
                                    itemBuilder: (context, index) {
                                      if (data == null) {
                                        return const Text(
                                            'Somthing went wrong');
                                      }
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    Details(data: data.docs[index]),
                                              ));
                                        },
                                        child: GridviewContainer(
                                            discountPercentage: data.docs[index]
                                                .data()['discountPercentage']
                                                .toString(),
                                            discountPrice: data.docs[index]
                                                .data()['discountPrice']
                                                .toString(),
                                            imageUrl: data.docs[index]
                                                .data()['image'],
                                            name:
                                                data.docs[index].data()['name'],
                                            price: data.docs[index]
                                                .data()['price']
                                                .toString()),
                                      );
                                    }),
                              );
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.height(30),
                  ),
                  const ListViewBYType(where: 'type', isEqualTo: 'Shirt'),
                  const ListViewBYType(where: 'type', isEqualTo: 'Saree'),
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
                ],
              ),
            ),
            SizedBox(
              height: context.width(225),
              width: MediaQuery.of(context).size.width,
              child: ref.watch(discoverPosterImageProvider).when(
                    data: (data) {
                      return CachedNetworkImage(
                        imageUrl: data,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                    error: (error, stackTrace) => Center(
                      child: Text('$error'),
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
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
      width: context.width(85),
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
