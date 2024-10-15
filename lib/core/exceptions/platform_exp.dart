class PlatformExp implements Exception {
  final String code;

  PlatformExp(this.code);

  String get message {
    switch (code) {
      // General Platform Errors
      case 'invalid-login-credentials':
        return 'Invalid login credentials. Please check your information.';
      case 'user-not-authorized':
        return 'User is not authorized to perform this action.';
      case 'network-error':
        return 'Network error occurred. Please check your internet connection.';
      case 'service-unavailable':
        return 'The service is currently unavailable. Please try again later.';
      case 'timeout':
        return 'The request timed out. Please try again.';
      case 'permission-denied':
        return 'Permission denied for this operation.';
      case 'unknown-error':
        return 'An unknown error occurred. Please try again.';

      // Firebase Errors
      case 'firebase-invalid-api-key':
        return 'The API key is invalid. Please check your Firebase configuration.';
      case 'firebase-user-disabled':
        return 'The user account has been disabled.';
      case 'firebase-user-not-found':
        return 'No user found with this email address.';
      case 'firebase-wrong-password':
        return 'The password is incorrect.';
      case 'firebase-email-already-in-use':
        return 'The email address is already in use.';

      // File System Errors
      case 'file-not-found':
        return 'The requested file could not be found.';

      case 'file-read-error':
        return 'An error occurred while reading the file.';
      case 'file-write-error':
        return 'An error occurred while writing to the file.';

      // Authentication Errors
      case 'invalid-credential':
        return 'The provided credential is invalid.';
      case 'expired-action-code':
        return 'The action code has expired.';

      // API Errors
      case 'api/invalid-request':
        return 'The API request was invalid. Please check the request parameters.';
      case 'api/rate-limited':
        return 'The API request was rate-limited. Please try again later.';

      default:
        return 'An unspecified error occurred.';
    }
  }
}
