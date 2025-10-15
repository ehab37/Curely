import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  Future<User> createAccount({
    required String email,
    required String password,
  }) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    // FirebaseAuth.instance.currentUser!.sendEmailVerification();
    return credential.user!;
  }

  Future<User> loginUser({
    required String email,
    required String password,
  }) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user!;
  }
}
