import 'package:get/get.dart';

validInput(String val, String type, int min, int max) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return " user name is invalid";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "email is invalid";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "phone number is invalid";
    }
  }

  if (val.isEmpty) {
    return "is empty";
  }
  if (val.length < min) {
    return "can't be less than $min";
  }
  if (val.length > max) {
    return "can't be more than $max";
  }
}
