import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glam_heaven_fashion_store/service/firestore_storage.dart';

final discoverPosterImageProvider = FutureProvider<String>((ref) async {
  return FirestoreStrorage.getDiscoverPoster();
});
