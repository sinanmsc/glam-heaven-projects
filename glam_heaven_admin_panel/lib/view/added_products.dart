import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glam_heaven_admin_panel/components/custom_textfield.dart';
import 'package:glam_heaven_admin_panel/extension/responsive.dart';
import 'package:glam_heaven_admin_panel/model/product_model.dart';
import 'package:glam_heaven_admin_panel/providers/product_firestore_provider.dart';
import 'package:glam_heaven_admin_panel/providers/product_providers.dart';
import 'package:glam_heaven_admin_panel/view/products_screen.dart';

class AddedProducts extends ConsumerWidget {
  const AddedProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details = ref.watch(getDetailsProvider);
    final productName = TextEditingController();
    final brand = TextEditingController();
    final discription = TextEditingController();
    final itemCount = TextEditingController();
    final price = TextEditingController();
    final discountPercentage = TextEditingController();
    final size1 = TextEditingController();
    final size2 = TextEditingController();
    final size3 = TextEditingController();
    final productType = TextEditingController();

    const double textfieldWidth = 250;
    return Column(
      children: [
        AppBar(
          title: const Text('Our Products'),
          backgroundColor: Colors.pink[300],
          foregroundColor: Colors.white,
        ),
        SizedBox(height: context.height(10)),
        const Text("Add Banners"),
        const Divider(),
        SingleChildScrollView(
          child: Column(
            children: [
              details.when(
                data: (data) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.pink[200],
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            context.width(20),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(context.width(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Image.network(
                              //   data.docs[index].data().image,
                              //   // "https://firebasestorage.googleapis.com/v0/b/glamheaven-ecom.appspot.com/o/productFile%2FMen's%20T-Shirt?alt=media&token=f56b94be-adc0-42ef-a392-b32887fb23f4",
                              //   width: 100,
                              //   // errorBuilder: (context, error, stackTrace) {
                              //   //   return Placeholder(
                              //   //     color: Colors.red,
                              //   //     child: Text("$error"),
                              //   //   );
                              //   // },
                              // ),
                              CachedNetworkImage(
                                imageUrl: data.docs[index].data().image,
                                width: context.width(150),
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) => Center(
                                  child: Text('$error'),
                                ),
                              ),
                              SizedBox(
                                width: context.width(250),
                                child: Text(
                                  data.docs[index].data().name,
                                  style: TextStyle(fontSize: context.width(28)),
                                ),
                              ),
                              Text(
                                data.docs[index].data().brand,
                                style: TextStyle(
                                    fontSize: context.width(28),
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                data.docs[index].data().type,
                                style: TextStyle(fontSize: context.width(28)),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      productName.text =
                                          data.docs[index].data().name;
                                      brand.text =
                                          data.docs[index].data().brand;
                                      productType.text =
                                          data.docs[index].data().type;
                                      discription.text =
                                          data.docs[index].data().discription;
                                      itemCount.text = data.docs[index]
                                          .data()
                                          .itemCount
                                          .toString();
                                      price.text = data.docs[index]
                                          .data()
                                          .price
                                          .toString();
                                      discountPercentage.text = data.docs[index]
                                          .data()
                                          .discountPercentage
                                          .toString();
                                      size1.text =
                                          data.docs[index].data().size[0];
                                      size2.text =
                                          data.docs[index].data().size[1];
                                      size3.text =
                                          data.docs[index].data().size[2];

                                      showDialog(
                                        context: context,
                                        builder: (context) =>
                                            SingleChildScrollView(
                                          child: AlertDialog(
                                              content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CustomeTextField(
                                                  controller: productName,
                                                  hintText: 'Product Name',
                                                  width: textfieldWidth),
                                              CustomeTextField(
                                                  hintText: 'Brand',
                                                  width: textfieldWidth,
                                                  controller: brand),
                                              CustomeTextField(
                                                  hintText: 'Product Type',
                                                  width: textfieldWidth,
                                                  controller: productType),
                                              CustomeTextField(
                                                  hintText: 'Discription',
                                                  width: textfieldWidth,
                                                  controller: discription),
                                              CustomeTextField(
                                                  hintText: 'Item Count',
                                                  width: textfieldWidth,
                                                  controller: itemCount),
                                              CustomeTextField(
                                                  hintText: 'Price',
                                                  width: textfieldWidth,
                                                  controller: price),
                                              CustomeTextField(
                                                  hintText:
                                                      'Discount Percentage',
                                                  width: textfieldWidth,
                                                  controller:
                                                      discountPercentage),
                                              Container(
                                                margin: EdgeInsets.all(
                                                    context.width(10)),
                                                padding: EdgeInsets.all(
                                                    context.width(7)),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width:
                                                            context.width(1))),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text('Size : '),
                                                    CustomeTextField(
                                                        hintText: 'Size 1',
                                                        width: textfieldWidth,
                                                        controller: size1),
                                                    CustomeTextField(
                                                        hintText: 'Size 2',
                                                        width: textfieldWidth,
                                                        controller: size2),
                                                    CustomeTextField(
                                                        hintText: 'Size 3',
                                                        width: textfieldWidth,
                                                        controller: size3),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  const Text('Free Delivery  '),
                                                  DropdownButton<bool>(
                                                    value: data.docs[index]
                                                        .data()
                                                        .freeDelivery,
                                                    items: const [
                                                      DropdownMenuItem(
                                                        value: true,
                                                        child: Text('True'),
                                                      ),
                                                      DropdownMenuItem(
                                                        value: false,
                                                        child: Text('False'),
                                                      )
                                                    ],
                                                    onChanged: (value) {
                                                      ref
                                                          .read(
                                                              isFreeDeliverProvider
                                                                  .notifier)
                                                          .state = value!;
                                                    },
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  const Text('Categoryn  '),
                                                  DropdownButton<String>(
                                                    value: data.docs[index]
                                                        .data()
                                                        .category,
                                                    icon: const Icon(Icons
                                                        .arrow_drop_down_sharp),
                                                    underline: const SizedBox(),
                                                    items: const [
                                                      DropdownMenuItem(
                                                          value: 'Men',
                                                          child: Text('Men')),
                                                      DropdownMenuItem(
                                                          value: 'Women',
                                                          child: Text('Women')),
                                                      DropdownMenuItem(
                                                          value: 'Boy',
                                                          child: Text('Boy')),
                                                      DropdownMenuItem(
                                                          value: 'Girl',
                                                          child: Text('Girl')),
                                                      DropdownMenuItem(
                                                        value: 'General',
                                                        child: Text('General'),
                                                      )
                                                    ],
                                                    onChanged: (value) {
                                                      ref
                                                          .read(categoryProvider
                                                              .notifier)
                                                          .state = value!;
                                                    },
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child:
                                                          const Text('Cancel')),
                                                  const SizedBox(width: 10),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        ref.read(upadateDataProvider(
                                                            ProductModelClass(
                                                                id: data
                                                                    .docs[index]
                                                                    .data()
                                                                    .id,
                                                                name: productName
                                                                    .text,
                                                                brand:
                                                                    brand.text,
                                                                image: data
                                                                    .docs[index]
                                                                    .data()
                                                                    .image,
                                                                discountPercentage:
                                                                    int.parse(discountPercentage
                                                                        .text),
                                                                discountPrice: int.parse(
                                                                        price
                                                                            .text) -
                                                                    getDiscountPrice(
                                                                        double.parse(price.text),
                                                                        double.parse(discountPercentage.text)),
                                                                discription: discription.text,
                                                                favCount: 0,
                                                                freeDelivery: ref.watch(isFreeDeliverProvider),
                                                                itemCount: int.parse(itemCount.text),
                                                                category: ref.watch(categoryProvider),
                                                                price: int.parse(price.text),
                                                                size: [
                                                                  size1.text,
                                                                  size2.text,
                                                                  size3.text,
                                                                ],
                                                                totalRating: 0,
                                                                type: productType.text)));
                                                        Navigator.pop(context);
                                                      },
                                                      child:
                                                          const Text('Change')),
                                                ],
                                              )
                                            ],
                                          )),
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.edit),
                                  ),
                                  SizedBox(width: context.width(20)),
                                  IconButton(
                                    onPressed: () {
                                      ref.read(deleteDataProvider(
                                          data.docs[index].id));
                                    },
                                    icon: const Icon(Icons.delete),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: data.docs.length,
                  );
                },
                error: (error, stackTrace) => Center(
                  child: Text('$error'),
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
              )
            ],
          ),
        )
      ],
    );
  }
}
