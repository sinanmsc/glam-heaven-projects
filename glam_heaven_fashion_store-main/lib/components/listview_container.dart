import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:glam_heaven_fashion_store/extensions/responsive_extension.dart';
import 'package:gradient_borders/gradient_borders.dart';

class ListviewContainer extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String brand;
  final String price;
  const ListviewContainer(
      {super.key,
      required this.brand,
      required this.imageUrl,
      required this.name,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.width(10)),
      decoration: const BoxDecoration(
        border: GradientBoxBorder(
            gradient: LinearGradient(colors: [Colors.black, Colors.white])),
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(context.width(10)),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: context.width(150),
              height: context.height(190),
              fit: BoxFit.fill,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: context.width(130),
                child: Text(name,
                    style: TextStyle(
                        fontSize: context.width(16),
                        fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis),
              ),
              SizedBox(
                width: context.width(150),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        brand,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w900,
                            color: Colors.black26),
                      ),
                    ),
                    Text(
                      price,
                      style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w900,
                          color: Colors.redAccent),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
