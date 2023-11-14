import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glam_heaven_fashion_store/service/auth_services.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

final authStateChangeProvider = StreamProvider<User?>((ref)  {
  return ref.read(authServiceProvider).authStateChange();
});