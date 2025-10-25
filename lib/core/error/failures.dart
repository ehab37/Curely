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
          errorDescription = 'Invalid email or password.';
          break;
        case 'weak-password':
          errorDescription = 'The password provided is too weak.';
          break;
        case 'invalid-email':
          errorDescription = 'Invalid email or password.';
          break;
        case 'invalid-credential':
          errorDescription = 'Invalid email or password.';
          break;
        case 'network-request-failed':
          errorDescription = 'There is no internet connection.';
          break;
        case 'too-many-requests':
          errorDescription = 'Too many requests. Please try again later.';
          break;
        default:
          errorDescription = e.code.toString();
          break;
      }
    } else {
      errorDescription = 'Authentication failed. Please try again later.';
    }
    return AuthExceptionHandler(errorDescription);
  }
}
