class FirebaseAuthEx implements Exception {
  final String code;

  FirebaseAuthEx(this.code);

  String get message {
    switch (code) {
      // Auth Errors
      case 'email-already-in-use':
        return 'The email address is already registered. Please use a different email.';
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.';
      case 'operation-not-allowed':
        return 'The operation is not allowed. Please contact support.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password.';
      case 'user-disabled':
        return 'The user account has been disabled. Please contact support.';
      case 'user-not-found':
        return 'No user found with this email address. Please check and try again.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';

      // Sign-in with provider errors
      case 'account-exists-with-different-credential':
        return 'An account already exists with a different credential.';
      case 'invalid-credential':
        return 'The provided credential is malformed or has expired.';

      case 'credential-already-in-use':
        return 'The credential is already associated with a different user.';
      case 'popup-closed-by-user':
        return 'The popup has been closed by the user before completing the sign-in.';
      case 'redirect-cancelled-by-user':
        return 'The sign-in redirect was canceled by the user.';
      case 'redirect-operation-pending':
        return 'Another redirect operation is pending.';
      case 'invalid-verification-code':
        return 'The verification code is invalid.';
      case 'invalid-verification-id':
        return 'The verification ID is invalid.';
      case 'missing-verification-code':
        return 'The verification code is missing.';
      case 'missing-verification-id':
        return 'The verification ID is missing.';
      case 'app-not-authorized':
        return 'This app is not authorized to use Firebase Authentication.';
      case 'invalid-api-key':
        return 'The API key is invalid.';
      case 'network-request-failed':
        return 'A network error occurred during the request.';
      case 'too-many-requests':
        return 'Too many requests. Please try again later.';
      case 'user-token-expired':
        return 'The user token has expired. Please sign in again.';
      // Auth errors
      case 'invalid-action-code':
        return 'The action code is invalid.';
      case 'invalid-session-cookie':
        return 'The session cookie is invalid.';
      case 'invalid-verify-email-request':
        return 'The email verification request is invalid.';
      case 'expired-action-code':
        return 'The action code has expired.';
      case 'session-cookie-expired':
        return 'The session cookie has expired.';
      case 'invalid-multi-factor-session':
        return 'The multi-factor session is invalid.';

      default:
        return 'An unknown error occurred.please try again';
    }
  }
}
