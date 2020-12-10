import 'package:o_learning/utils/regex_helper.dart';

class ValidateHelper {
  static bool isEmailValid(String email) {
    if (new RegExp(RegexHelper.emailRegex).hasMatch(email)) {
      return true;
    }

    return false;
  }
}
