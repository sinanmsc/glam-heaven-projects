import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glam_heaven_admin_panel/extension/responsive.dart';
import 'package:glam_heaven_admin_panel/providers/storage_provider.dart';
import 'package:glam_heaven_admin_panel/services/storage_services.dart';
import 'package:image_picker/image_picker.dart';

class AddPosterScreen extends ConsumerWidget {
  final ImagePicker imagePicker = ImagePicker();
  AddPosterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppBar(
          backgroundColor: Colors.pink[300],
          foregroundColor: Colors.white,
          title: const Text("Poster Screen"),
        ),
        SizedBox(height: context.height(10)),
        const Text("For Discover Posters"),
        const Divider(),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // SizedBox(
            //   width: MediaQuery.sizeOf(context).width * 0.4,
            //   child: const TextField(
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //     ),
            //   ),
            // ),
            SizedBox(height: context.height(15)),
            Container(
              margin: EdgeInsets.only(bottom: context.height(20)),
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
                  InkWell(
                    onTap: () async {
                      if (kIsWeb) {
                        try {
                          final XFile? pickedImage = await imagePicker
                              .pickImage(source: ImageSource.gallery);
                          if (pickedImage != null) {
                            ref.read(discoverPosterU8Provider.notifier).state =
                                await pickedImage.readAsBytes();
                            ref.read(discoverExtensionProvider.notifier).state =
                                pickedImage.name.split('.').last;
                          }
                        } catch (e) {
                          Text('$e');
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(context.width(10)),
                      child: ref.watch(discoverPosterU8Provider) == null
                          ? Image.asset(
                              'asset/maxresdefault.jpg',
                              width: context.width(700),
                            )
                          : Image.memory(ref.watch(discoverPosterU8Provider)!),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (ref.watch(discoverExtensionProvider) != null ||
                      ref.watch(discoverPosterU8Provider) != null) {
                    ProductStorage.uploadDiscoverPoster(
                        ref.watch(discoverPosterU8Provider)!,
                        ref.watch(discoverExtensionProvider)!);
                  }
                },
                child: const Text('Done'))
          ],
        ),
      ],
    );
  }
}
