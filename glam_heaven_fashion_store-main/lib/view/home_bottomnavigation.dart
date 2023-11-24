import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glam_heaven_fashion_store/provider/providers.dart';
import 'package:glam_heaven_fashion_store/view/home.dart';

class BottomNavi extends ConsumerWidget {
  final String uid;
  BottomNavi({super.key, required this.uid});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          ref.read(currentPageProvider.notifier).state = value;
        },
        children: [
          Home(uid: uid),
          const Center(child: Text("2")),
          const Center(child: Text("3")),
          const Center(child: Text("4")),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ref.watch(currentPageProvider),
        onTap: (value) {
          ref.watch(currentPageProvider.notifier).state = value;
          pageController.animateToPage(value,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        },
        selectedItemColor: const Color.fromARGB(255, 248, 145, 145),
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.grey[350],
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        iconSize: 30,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Store",
            icon: Icon(CupertinoIcons.color_filter),
          ),
          BottomNavigationBarItem(
            label: "Cart",
            icon: Icon(CupertinoIcons.shopping_cart),
          ),
          BottomNavigationBarItem(
            label: "Wishlist",
            icon: Icon(CupertinoIcons.heart),
          ),
        ],
      ),
    );
  }
}
