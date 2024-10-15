import 'package:flutter/material.dart';
import 'dart:math';

import 'package:intl/intl.dart';

class Format {
  // Validate Email
  static bool isValidEmail(String? email) {
    if (email == null) return false;
    final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    return emailRegex.hasMatch(email);
  }

  // Format Date
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-YYYY').format(date);
  }

  // Calculate distance between two geographical points
  static double calculateDistance(
      double lat1, double lon1, double lat2, double lon2) {
    const double R = 6371e3; // Earth radius in meters
    final double phi1 = lat1 * (pi / 180);
    final double phi2 = lat2 * (pi / 180);
    final double deltaPhi = (lat2 - lat1) * (pi / 180);
    final double deltaLambda = (lon2 - lon1) * (pi / 180);

    final double a = (sin(deltaPhi / 2) * sin(deltaPhi / 2)) +
        (cos(phi1) * cos(phi2) * sin(deltaLambda / 2) * sin(deltaLambda / 2));
    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return R * c;
  }

  // Capitalize the first letter of a string
  static String capitalize(String? s) {
    if (s == null || s.isEmpty) {
      return '';
    }
    return s[0].toUpperCase() + s.substring(1);
  }

  // Convert hex color to Color object
  static Color hexToColor(String hexCode) {
    final hex = hexCode.replaceAll("#", "");
    if (hex.length == 6) {
      return Color(int.parse("FF$hex", radix: 16));
    } else if (hex.length == 8) {
      return Color(int.parse(hex, radix: 16));
    } else {
      throw ArgumentError("Hex color must be 6 or 8 digits long");
    }
  }

  // Format number as currency
  static String currency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  // Format phone number
  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 10) {
      return "(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}";
    } else if (phoneNumber.length == 11) {
      "(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}";
    }
    return phoneNumber;
  }

  // Format international phone number
  static String formatInternationalPhoneNumber(String? phoneNumber,
      {String countryCode = ''}) {
    if (phoneNumber == null) return '';
    final cleaned = phoneNumber.replaceAll(RegExp(r'\D'), '');
    final formatted = cleaned.replaceAllMapped(
        RegExp(r'(\d{1,3})(\d{3})(\d{3})(\d{4})'),
        (Match m) => "+$countryCode ${m[1]} ${m[2]} ${m[3]} ${m[4]}");
    return formatted.startsWith('+') ? formatted : "+$countryCode $formatted";
  }
}
