import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:glam_heaven_fashion_store/extensions/responsive_extension.dart';

class GridviewContainer extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String price;
  final String discountPrice;
  final String discountPercentage;

  const GridviewContainer(
      {super.key,
      required this.discountPercentage,
      required this.discountPrice,
      required this.imageUrl,
      required this.name,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.width(7)),
      decoration: BoxDecoration(
        border: Border.all(width: context.width(0.5)),
        color: const Color(0xFFF1F0F0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(height: context.height(15)),
          ClipRRect(
            borderRadius: BorderRadius.circular(context.width(15)),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              width: 150,
              height: 140,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    '\$ $price ',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: context.width(13),
                        decoration: TextDecoration.lineThrough),
                  ),
                  Text(
                    '\t\$ $discountPrice',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: context.width(16),
                        fontWeight: FontWeight.w900),
                  )
                ],
              ),
              Container(
                alignment: Alignment.center,
                height: 30,
                width: 75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(context.width(15)),
                    color: Colors.red[200]),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: '$discountPercentage%',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: context.width(20)),
                  ),
                  TextSpan(
                      text: ' off',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: context.width(15)))
                ])),
              )
            ],
          ),
        ],
      ),
    );
  }
}
