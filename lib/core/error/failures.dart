import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class OtherErrors extends Failure {
  OtherErrors(super.errMessage);

  factory OtherErrors.fromOtherErrors(e) {
    return OtherErrors(e.toString());
  }
}

class AuthExceptionHandler extends Failure {
  AuthExceptionHandler(super.errMessage);

  factory AuthExceptionHandler.fromAuthException(e) {
    var errorDescription = '';
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'email-already-in-use':
          errorDescription = 'This email is already in use.';
          break;
        case 'user-not-found':
          errorDescription = 'User not found.';
          break;
        case 'wrong-password':
          errorDescription = 'Wrong password.';
          break;
        case 'weak-password':
          errorDescription = 'The password provided is too weak.';
          break;
        case 'invalid-email':
          errorDescription = 'The email address is not valid.';
          break;
        default:
          errorDescription = 'Authentication failed. Please try again later.';
          break;
      }
    } else {
      errorDescription = 'Authentication failed. Please try again later.';
    }
    return AuthExceptionHandler(errorDescription);
  }
}
