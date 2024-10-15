class AppValidator {
  // Validator Email
  static String? validatorEmail(String? val) {
    if (val == null || val.isEmpty) {
      return 'Email is required.';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(val)) {
      return 'Invalid email address.';
    }
    return null;
  }

// Validator Password
  static String? validatorPassword(String? val) {
    if (val == null || val.isEmpty) {
      return 'Password is required.';
    }

    if (val.length < 8) {
      return 'Password must be at least 8 characters long.';
    }

    if (!val.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.';
    }

    if (!val.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }

    if (!val.contains(RegExp(r'[!@#$%^&*(),.?";{}|<>]'))) {
      return 'Password must contain at least one special character !@#\$%^&*(),.?";{}|<>.';
    }

    return null;
  }

  //Validator Phone
  static String? validatorPhone(String? val) {
    if (val == null || val.isEmpty) {
      return 'Phone number is required.';
    }

    if (!RegExp(r'^\d{11}$').hasMatch(val)) {
      return 'Phone number must be 11 digits long.';
    }

    return null;
  }

  // Empty Text Validation

  static String? validEmptyField(String fieldName, String? val) {
    if (val == null || val.isEmpty) {
      return '$fieldName is required.';
    }
    return null;
  }
}
