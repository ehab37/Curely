import 'package:easy_localization/easy_localization.dart';
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
          errorDescription = 'email_already_in_use'.tr();
          break;
        case 'user-not-found':
          errorDescription = 'user_not_found'.tr();
          break;
        case 'wrong-password':
          errorDescription = 'wrong_password'.tr();
          break;
        case 'weak-password':
          errorDescription = 'weak_password'.tr();
          break;
        case 'invalid-email':
          errorDescription = 'invalid_email'.tr();
          break;
        case 'invalid-credential':
          errorDescription = 'invalid_credential'.tr();
          break;
        case 'network-request-failed':
          errorDescription = 'network_request_failed'.tr();
          break;
        case 'too-many-requests':
          errorDescription = 'too_many_requests'.tr();
          break;
        case 'unknown':
          errorDescription = 'unknown_error'.tr();
          break;
        default:
          errorDescription = e.code.toString();
          break;
      }
    } else {
      errorDescription = 'auth_failed'.tr();
    }
    return AuthExceptionHandler(errorDescription);
  }
}
