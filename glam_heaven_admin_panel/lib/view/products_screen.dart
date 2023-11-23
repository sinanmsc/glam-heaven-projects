import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glam_heaven_admin_panel/components/custom_textfield.dart';
import 'package:glam_heaven_admin_panel/extension/responsive.dart';
import 'package:glam_heaven_admin_panel/model/product_model.dart';
import 'package:glam_heaven_admin_panel/providers/product_firestore_provider.dart';
import 'package:glam_heaven_admin_panel/providers/product_providers.dart';
import 'package:glam_heaven_admin_panel/providers/storage_provider.dart';
import 'package:glam_heaven_admin_panel/services/storage_services.dart';
import 'package:image_picker/image_picker.dart';

class ProductsScreen extends ConsumerWidget {
  ProductsScreen({super.key});
  final productName = TextEditingController(text: "Men's T-Shirt");
  final brand = TextEditingController(text: "Adibas");
  final discription = TextEditingController(text: "An adibas production");
  final itemCount = TextEditingController(text: "1");
  final price = TextEditingController(text: "1000");
  final discountPercentage = TextEditingController(text: "20");
  final size1 = TextEditingController(text: 'S');
  final size2 = TextEditingController(text: 'M');
  final size3 = TextEditingController(text: 'L');
  final productType = TextEditingController(text: "T-Shirt");
  final ImagePicker imagePicker = ImagePicker();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<bool> isFreeDeliver = [true, false];
    return SingleChildScrollView(
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.pink[300],
            foregroundColor: Colors.white,
            title: const Text("Product Screen"),
          ),
          SizedBox(height: context.height(10)),
          const Text("Add Products"),
          const Divider(),
          Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomeTextField(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    controller: productName,
                    field: 'Product Name',
                    hintText: 'Product Name'),
                CustomeTextField(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    controller: brand,
                    field: 'Brand               ',
                    hintText: 'Brand'),
                CustomeTextField(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    controller: discription,
                    field: 'Discription      ',
                    hintText: 'Discription'),
                CustomeTextField(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    controller: itemCount,
                    field: 'Item Count     ',
                    hintText: 'Item Count'),
                Container(
                  padding: EdgeInsets.all(context.width(10)),
                  decoration: BoxDecoration(
                      border: Border.all(width: context.width(0.5))),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Free Delivery'),
                      SizedBox(width: context.width(15)),
                      DropdownButton<bool>(
                        value: ref.watch(isFreeDeliverProvider),
                        icon: const Icon(Icons.arrow_drop_down_sharp),
                        underline: const SizedBox(),
                        items: isFreeDeliver
                            .map<DropdownMenuItem<bool>>((bool value) {
                          return DropdownMenuItem<bool>(
                            value: value,
                            child: Text(
                              value.toString(),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          ref.read(isFreeDeliverProvider.notifier).state =
                              value!;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.height(10)),
                Container(
                  padding: EdgeInsets.all(context.width(10)),
                  decoration: BoxDecoration(
                      border: Border.all(width: context.width(0.5))),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Category'),
                      SizedBox(width: context.width(15)),
                      DropdownButton<String>(
                        value: ref.watch(categoryProvider),
                        icon: const Icon(Icons.arrow_drop_down_sharp),
                        underline: const SizedBox(),
                        items: const [
                          DropdownMenuItem(value: 'Men', child: Text('Men')),
                          DropdownMenuItem(
                              value: 'Women', child: Text('Women')),
                          DropdownMenuItem(value: 'Boy', child: Text('Boy')),
                          DropdownMenuItem(value: 'Girl', child: Text('Girl')),
                          DropdownMenuItem(
                            value: 'General',
                            child: Text('General'),
                          )
                        ],
                        onChanged: (value) {
                          ref.read(categoryProvider.notifier).state = value!;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.height(10)),
                Container(
                  padding: EdgeInsets.all(context.width(10)),
                  decoration: BoxDecoration(
                      border: Border.all(width: context.width(1)),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () async {},
                        child: const Text(
                          'Add image',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          if (kIsWeb) {
                            try {
                              final XFile? pickedImage = await imagePicker
                                  .pickImage(source: ImageSource.gallery);
                              if (pickedImage != null) {
                                var im = await pickedImage.readAsBytes();
                                ref
                                    .read(imageExtensionProvider.notifier)
                                    .state = pickedImage.name.split('.').last;
                                ref
                                    .read(webProductImageProvider.notifier)
                                    .state = im;
                              }
                            } catch (e) {
                              Text(e.toString());
                            }
                          }
                        },
                        child: Container(
                            padding: EdgeInsets.all(context.width(10)),
                            child: ref.watch(webProductImageProvider) == null
                                ? Image.asset(
                                    'asset/maxresdefault.jpg',
                                    width: context.width(600),
                                  )
                                : Image.memory(
                                    ref.watch(webProductImageProvider)!)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.height(10)),
                CustomeTextField(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    hintText: "Price",
                    field: 'Price',
                    controller: price),
                CustomeTextField(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    hintText: "Diccount Percentage",
                    field: 'Discount Percentage',
                    controller: discountPercentage),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Size : ',
                      style: TextStyle(fontSize: context.width(22)),
                    ),
                    CustomeTextField(
                      width: context.width(150),
                      hintText: 'Size 1',
                      controller: size1,
                    ),
                    CustomeTextField(
                      width: context.width(150),
                      hintText: 'Size 2',
                      controller: size2,
                    ),
                    CustomeTextField(
                      width: context.width(150),
                      hintText: 'Size 3',
                      controller: size3,
                    ),
                  ],
                ),
                CustomeTextField(
                  hintText: 'Product Type',
                  controller: productType,
                  field: 'Produvt Type',
                  width: MediaQuery.sizeOf(context).width * 0.4,
                ),
                TextButton(
                  onPressed: () async {
                    if (kIsWeb) {
                      try {
                        final url = await ProductStorage.uploadProductImage(
                          ref.watch(webProductImageProvider)!,
                          DateTime.now().toString(),
                          ref.watch(imageExtensionProvider)!,
                        );
                        log(url);
                        ref.read(
                          addProductProvider(
                            ProductModelClass(
                                name: productName.text,
                                brand: brand.text,
                                discountPercentage:
                                    int.parse(discountPercentage.text),
                                discription: discription.text,
                                favCount: 0,
                                freeDelivery: ref.watch(isFreeDeliverProvider),
                                itemCount: int.parse(itemCount.text),
                                price: int.parse(price.text),
                                size: [
                                  size1.text,
                                  size2.text,
                                  size3.text,
                                ],
                                totalRating: 0,
                                category: ref.watch(categoryProvider),
                                type: productType.text,
                                image: url,
                                discountPrice: int.parse(price.text) -
                                    getDiscountPrice(double.parse(price.text),
                                        double.parse(discountPercentage.text))),
                          ),
                        );
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text("$e")));
                          log(e.toString());
                        }
                      }
                    }
                    productName.clear();
                    price.clear();
                    productType.clear();
                    discription.clear();
                    brand.clear();
                    itemCount.clear();
                    ref.read(webProductImageProvider.notifier).state = null;
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.pink)),
                  child: const Text(
                    'Done',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: context.height(20)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

double getDiscountPrice(double amount, double discount) {
  double dicountPrice = (amount * discount) / 100;
  return dicountPrice;
}
