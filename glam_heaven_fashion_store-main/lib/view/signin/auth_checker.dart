import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glam_heaven_fashion_store/view/home_bottomnavigation.dart';
import 'package:glam_heaven_fashion_store/provider/auth_service_provider.dart';
import 'package:glam_heaven_fashion_store/view/get_start.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(authStateChangeProvider).when(
          data: (data) {
            log("data:$data");
            if (data == null) {
              return const GetStart();
            }
            // log("data:$data");

            return BottomNavi(
              uid: data.uid,
            );
          },
          error: (error, stackTrace) => Center(
            child: Text('$error'),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}
