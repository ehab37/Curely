import 'package:curely/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  static bool isInitialize = false;

  Future<User> createAccount({
    required String email,
    required String password,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // FirebaseAuth.instance.currentUser!.sendEmailVerification();
    return credential.user!;
  }

  Future<User> loginUser({
    required String email,
    required String password,
  }) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user!;
  }

  static Future<void> initSignIn() async {
    if (!isInitialize) {
      await _googleSignIn.initialize(
        serverClientId: DatabaseKeys.serverClientId,
      );
    }
    isInitialize = true;
  }

  Future<User> loginWithGoogle() async {
    initSignIn();
    final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();
    final idToken = googleUser.authentication.idToken;
    final authorizationClient = googleUser.authorizationClient;
    GoogleSignInClientAuthorization? authorization = await authorizationClient
        .authorizationForScopes([DatabaseKeys.email, DatabaseKeys.profile]);
    final accessToken = authorization?.accessToken;
    if (accessToken == null) {
      final authorization2 = await authorizationClient.authorizationForScopes([
        DatabaseKeys.email,
        DatabaseKeys.profile,
      ]);
      if (authorization2?.accessToken == null) {
        throw FirebaseAuthException(
          code: DatabaseKeys.error,
          message: DatabaseKeys.error,
        );
      }
      authorization = authorization2;
    }
    final credential = GoogleAuthProvider.credential(
      accessToken: accessToken,
      idToken: idToken,
    );
    final UserCredential userCredential = await _auth.signInWithCredential(
      credential,
    );
    final User? user = userCredential.user;
    return user!;
  }

  Future<void> resetPassword({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  static User? getCurrentUser() {
    return _auth.currentUser;
  }
  static bool isUserLoggedIn() {
    return _auth.currentUser != null;
  }

  Future<void> logoutUser() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  Future<void> deleteUser() async {
    await _auth.currentUser!.delete();
  }
}
