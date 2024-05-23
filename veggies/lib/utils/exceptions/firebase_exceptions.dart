class VFirebaseException implements Exception {
  final String code;

  VFirebaseException(this.code);

  String get message{
    switch(code){
      case 'unknown':
        return 'An unknown error occurred';
      case 'invalid-custom-token':
        return 'Invalid custom token';
      case 'custom-token-mismatch':
return 'Custom token format is incorrect. Please check your custom token';
      case 'captcha-check-failed':
        return 'the reCaptcha response is invalid. Please try again';
      case 'invalid-verification-id':
        return 'Invalid verification id';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid verification code';
      case 'keychain-error':
        return 'A keychain error occurred. Please check keychain and try again';
      case 'app-not-authorized':
        return 'A app is not authorized to use firebase authentication with the provided api key';
      case 'internal-error':
        return 'An internal error occurred. Please try again later';
      case 'invalid-app-credentials':
        return 'Invalid app credentials';
      case 'email-already-in-use':
        return 'the email already in use. Please try different Email';
      case 'invalid-email':
        return 'The email is invalid. Please try different Email';
      case 'weak-password':
        return 'The password is too weak. Please try strong Password';
      case 'user-disabled':
        return 'The user account disabled. Please contact support for assistance';
      case 'user-not-found':
        return 'The user account not found.';
      case 'wrong-password':
        return 'Incorrect Password. Please check your password and try again';
      case 'too-many-requests':
        return 'Too many requests. Please try again later';
      case 'email-already-exists':
        return 'The email already exists. Please try different Email';
      case 'user-mismatch':
        return 'the supplied credentials do not correspond to the previously singed in users';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires a recent authentication. Please log in again';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Please contact support for assistance';
      case 'expired-action-code':
        return 'The action code has expired. Please request a new action code';
      case 'invalid-action-code':
        return 'The action code is invalid. Please check the action code and try again';
      case 'missing-action-code':
        return 'The action code is missing. Please check the action code and try again';
      case 'user-token-expired':
        return 'The user token has expired and authentication is required. Please log in again';
      default:
        return 'Something went wrong. Please try again later';
    }
  }
}