import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glam_heaven_fashion_store/view/home.dart';

class BottomNavi extends StatelessWidget {
  BottomNavi({super.key});

  final PageController controller = PageController();
  final NotchBottomBarController _controller = NotchBottomBarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: const [
          Home(),
          // Center(child: Text("1")),
          Center(child: Text("2")),
          Center(child: Text("3")),
          Center(child: Text("4")), // Changed one of them to "4".
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedNotchBottomBar(
            itemLabelStyle: const TextStyle(
                color: Colors.black), // Use 'const' for constant values.
            onTap: (value) {
              // _controller.jumpTo(value);
            },
            notchBottomBarController: _controller,
            bottomBarItems: const [
              BottomBarItem(
                itemLabel: "Home", // Removed unnecessary parentheses.
                inActiveItem: Icon(Icons.home),
                activeItem: Icon(Icons.home),
              ),
              BottomBarItem(
                itemLabel: "Store", // Corrected the label.
                inActiveItem: Icon(CupertinoIcons.color_filter),
                activeItem: Icon(CupertinoIcons.color_filter),
              ),
              BottomBarItem(
                itemLabel: "Cart", // Corrected the label.
                inActiveItem: Icon(CupertinoIcons.shopping_cart),
                activeItem: Icon(CupertinoIcons.shopping_cart),
              ),
              BottomBarItem(
                itemLabel: "Wishlist", // Corrected the label.
                inActiveItem: Icon(CupertinoIcons.heart),
                activeItem: Icon(CupertinoIcons.heart),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
