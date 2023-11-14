import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final auth = FirebaseAuth.instance;

  Stream<User?> authStateChange() => auth.authStateChanges();

  Future<UserCredential> login(String email, String password) {
    return auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> signup(String email, String password) {
    return auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> logout() => auth.signOut();
}
