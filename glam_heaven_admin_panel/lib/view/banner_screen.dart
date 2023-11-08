import 'package:flutter/material.dart';
import 'package:glam_heaven_admin_panel/extension/responsive.dart';

class BannerScreen extends StatelessWidget {
  const BannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppBar(
          backgroundColor: Colors.pink[300],
          foregroundColor: Colors.white,
          title: const Text("Banner Screen"),
        ),
        SizedBox(height: context.height(10)),
        const Text("Add Banners"),
        const Divider(),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.4,
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: context.height(15)),
            Container(
              padding: EdgeInsets.all(context.width(10)),
              decoration: BoxDecoration(
                  border: Border.all(width: context.width(1)),
                  borderRadius: BorderRadius.circular(context.width(20))),
              child: Column(
                children: [
                  const Text(
                    'Add image',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.all(context.width(10)),
                    child: Image.asset(
                      'asset/maxresdefault.jpg',
                      width: context.width(700),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
