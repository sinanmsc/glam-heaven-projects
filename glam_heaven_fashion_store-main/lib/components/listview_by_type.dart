import 'package:flutter/material.dart';
import 'package:glam_heaven_fashion_store/components/listview_container.dart';
import 'package:glam_heaven_fashion_store/extensions/responsive_extension.dart';
import 'package:glam_heaven_fashion_store/service/product_firestore.dart';

class ListViewBYType extends StatelessWidget {
 final String where;
 final String isEqualTo;
  const ListViewBYType({super.key,required this.where,required this.isEqualTo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: const Alignment(-0.95, 0),
          child: Text(
            isEqualTo,
            style: TextStyle(
                color: Colors.black,
                fontSize: context.width(22),
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: context.height(330),
          child: FutureBuilder(
            future: GlameProducts.readProducts(where, isEqualTo),
            builder: (context, snapshot) {
              final data = snapshot.data;
              if (data == null) {
                return const Center(child: Text('Somthing went wrong'));
              }
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: data.docs.length,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                itemBuilder: (context, index) {
                  return ListviewContainer(
                      brand: data.docs[index].data()['brand'],
                      imageUrl: data.docs[index].data()['image'],
                      name: data.docs[index].data()['name'],
                      price: data.docs[index].data()['price'].toString());
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: context.width(10),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
