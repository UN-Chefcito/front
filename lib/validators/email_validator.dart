// Email Validator
import 'package:chefcito/core/constants/strings.dart';

bool isValidEmail(String email) {
  return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
}

String? emailValidator({required String? email}) {
  email ??= "";
  if (email.isEmpty) {
    return ErrorTexts.emptyEmail;
  }
  if (!isValidEmail(email)) {
    return ErrorTexts.invalidEmail;
  }
  return null;
}
