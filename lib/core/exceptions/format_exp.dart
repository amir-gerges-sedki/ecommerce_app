class FormatExp implements Exception {
  final String message;

  const FormatExp(
      [this.message =
          'An unexpected format error occurred. Please check your input.']);

  factory FormatExp.fromMessage(String message) {
    return FormatExp(message);
  }

  factory FormatExp.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const FormatExp(
            'The email address format is invalid. Please enter a valid email.');
      case 'invalid-phone-format':
        return const FormatExp(
            'The phone number format is invalid. Please enter a valid phone number.');
      case 'invalid-date-format':
        return const FormatExp(
            'The date format is invalid. Please use the format YYYY-MM-DD.');
      case 'invalid-url-format':
        return const FormatExp(
            'The URL format is invalid. Please enter a valid URL.');
      case 'invalid-credit-card-format':
        return const FormatExp(
            'The credit card number format is invalid. Please enter a valid credit card number.');
      case 'invalid-numeric-format':
        return const FormatExp(
            'The numeric format is invalid. Please enter a valid number.');
      default:
        return const FormatExp(
            'An unknown format error occurred. Please check your input.');
    }
  }
}
