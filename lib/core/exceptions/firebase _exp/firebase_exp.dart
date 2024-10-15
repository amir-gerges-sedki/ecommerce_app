class FirebaseEx implements Exception {
  final String code;

  FirebaseEx(this.code);

  String get message {
    switch (code) {
      case 'invalid-custom-token':
        return 'The custom token format is incorrect. Please check your custom token.';
      case 'invalid-credential':
        return 'The provided credential is malformed or has expired.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'invalid-api-key':
        return 'The API key is invalid.';
      case 'user-disabled':
        return 'The user account has been disabled.';
      case 'user-not-found':
        return 'No user found with this email address.';
      case 'wrong-password':
        return 'The password is incorrect.';
      case 'email-already-in-use':
        return 'The email address is already in use.';
      case 'operation-not-allowed':
        return 'The operation is not allowed.';
      case 'weak-password':
        return 'The password is too weak.';
      case 'expired-action-code':
        return 'The action code has expired.';
      case 'invalid-action-code':
        return 'The action code is invalid.';
      case 'invalid-session-cookie':
        return 'The session cookie is invalid.';
      case 'invalid-verify-email-request':
        return 'The email verification request is invalid.';
      case 'missing-verification-code':
        return 'The verification code is missing.';
      case 'missing-verification-id':
        return 'The verification ID is missing.';
      case 'credential-already-in-use':
        return 'The credential is already associated with a different user.';
      case 'popup-closed-by-user':
        return 'The popup has been closed by the user before completing the sign-in.';
      case 'redirect-cancelled-by-user':
        return 'The sign-in redirect was canceled by the user.';
      case 'redirect-operation-pending':
        return 'Another redirect operation is pending.';
      case 'user-token-expired':
        return 'The user token has expired. Please sign in again.';
      case 'invalid-verification-code':
        return 'The verification code is invalid.';
      case 'invalid-verification-id':
        return 'The verification ID is invalid.';
      case 'network-request-failed':
        return 'A network error occurred during the request.';
      case 'too-many-requests':
        return 'Too many requests. Please try again later.';
      case 'app-not-authorized':
        return 'This app is not authorized to use Firebase Authentication.';
      case 'quota-exceeded':
        return 'The quota for this service has been exceeded.';
      case 'project-not-found':
        return 'The Firebase project was not found.';
      case 'request-denied':
        return 'Your request was denied. Please check your permissions.';
      case 'internal-error':
        return 'An internal error occurred. Please try again later.';
      default:
        return 'An unknown authentication error occurred.please try again';
    }
  }
}
