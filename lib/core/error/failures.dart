import 'package:curely/generated/l10n.dart';
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
          errorDescription = S.current.thisEmailIsAlreadyInUse;
          break;
        case 'user-not-found':
          errorDescription = S.current.userNotFound;
          break;
        case 'wrong-password':
          errorDescription = S.current.invalidEmailOrPassword;
          break;
        case 'weak-password':
          errorDescription = S.current.weakPassword;
          break;
        case 'invalid-email':
          errorDescription = S.current.invalidEmailOrPassword;
          break;
        case 'invalid-credential':
          errorDescription = S.current.invalidEmailOrPassword;
          break;
        case 'network-request-failed':
          errorDescription = S.current.noInternetConnection;
          break;
        case 'too-many-requests':
          errorDescription = S.current.tooManyRequests;
          break;
        case 'unknown':
          errorDescription = "Please, check your internet connection";
          break;
        default:
          errorDescription = e.code.toString();
          break;
      }
    } else {
      errorDescription = S.current.authenticationFailed;
    }
    return AuthExceptionHandler(errorDescription);
  }
}
