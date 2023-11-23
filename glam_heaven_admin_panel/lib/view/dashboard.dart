import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glam_heaven_admin_panel/providers/dashboard_providers.dart';
import 'package:glam_heaven_admin_panel/view/added_products.dart';
import 'package:glam_heaven_admin_panel/view/add_poster_screen.dart';
import 'package:glam_heaven_admin_panel/view/home_screen.dart';
import 'package:glam_heaven_admin_panel/view/products_screen.dart';

class DashBoard extends ConsumerWidget {
  DashBoard({super.key});

  final screens = [
    const HomeScreen(),
     AddPosterScreen(),
    ProductsScreen(),
    const AddedProducts()
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        backgroundColor: Colors.pink[400],
        foregroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: MediaQuery.sizeOf(context).height * 0.08,
        title: const Text("Glam Heaven Admin Panel"),
      ),
      body: Row(
        children: [
          Ink(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width * 0.14,
            color: Colors.pink[400],
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    ref.read(dashIndexProvider.notifier).state = 0;
                  },
                  hoverColor: Colors.grey[200]!.withOpacity(0.3),
                  leading: const Icon(Icons.home),
                  title: const Text("Home"),
                ),
                ListTile(
                  onTap: () {
                    ref.read(dashIndexProvider.notifier).state = 1;
                  },
                  hoverColor: Colors.grey[200]!.withOpacity(0.3),
                  leading: const Icon(Icons.home),
                  title: const Text("Posters"),
                ),
                ListTile(
                  onTap: () {
                    ref.read(dashIndexProvider.notifier).state = 2;
                  },
                  hoverColor: Colors.grey[200]!.withOpacity(0.3),
                  leading: const Icon(Icons.store),
                  title: const Text("Add Prodcuts"),
                ),
                ListTile(
                  onTap: () {
                    ref.read(dashIndexProvider.notifier).state = 3;
                  },
                  hoverColor: Colors.grey[200]!.withOpacity(0.3),
                  leading: const Icon(Icons.format_shapes_sharp),
                  title: const Text("Our Prodcuts"),
                ),
              ],
            ),
          ),
          Expanded(child: screens[ref.watch(dashIndexProvider)])
        ],
      ),
    );
  }
}
