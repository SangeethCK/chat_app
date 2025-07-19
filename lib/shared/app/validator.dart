enum InputFormatType { name, phoneNumber, email, password }

class Validator {
  Validator.__();

  // static String? validatePassword(String? value, {String? msg}) {
  //   String errorMsg = msg ?? StringConstants.enterValidPassword;
  //   if ((msg ?? '').isNotEmpty) {
  //     return msg;
  //   } else if ((value ?? '').isEmpty) {
  //     return StringConstants.emptyPasswordMsg;
  //   } else if (value!.length < 8) {
  //     return errorMsg;
  //   } else if (!value.contains(RegExp(r'[0-9]'))) {
  //     return errorMsg;
  //   } else if (!value
  //       .contains(RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?\d)\S{8,}$'))) {
  //     return errorMsg;
  //   } else if (!value.contains(RegExp(r'[A-Z]'))) {
  //     return errorMsg;
  //   }
  //   return null;
  // }

  // static String? validateLoginPassword(String? value, {String? msg}) {
  //   if ((msg ?? '').isNotEmpty) {
  //     return msg;
  //   } else if ((value ?? '').isEmpty) {
  //     return StringConstants.emptyPasswordMsg;
  //   }
  //   return null;
  // }

  // static String? validateConfirmPassword(
  //     String? oldPassword, String? newPassword) {
  //   if ((newPassword ?? '').isEmpty) {
  //     return StringConstants.emptyConfirmPasswordMsg;
  //   } else if (oldPassword != newPassword) {
  //     return StringConstants.passwordNotEqual;
  //   }
  //   return null;
  // }

  // static String? validateEmail(String? value, {String? msg}) {
  //   // String pattern =
  //   //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  //   String pattern =
  //       r'^(?=.{1,320}$)[a-zA-Z0-9._%+-]{1,64}@[a-zA-Z0-9.-]{1,255}\.[a-zA-Z]{2,63}$';
  //   RegExp regex = RegExp(pattern);
  //   if (msg != null) return msg;
  //   if ((value ?? '').isEmpty) return StringConstants.emptyEmailMsg;
  //   if (!regex.hasMatch(value!)) {
  //     return StringConstants.emailValidatorMsg;
  //   } else {
  //     return null;
  //   }
  // }

  // static List<TextInputFormatter>? inputFormatter(InputFormatType type) {
  //   List<TextInputFormatter>? val;
  //   switch (type) {
  //     case InputFormatType.phoneNumber:
  //       val = [
  //         FilteringTextInputFormatter.allow(RegExp("[0-9]")),
  //       ];
  //       break;

  //     case InputFormatType.password:
  //       val = [
  //         FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z@]")),
  //       ];
  //       break;
  //     case InputFormatType.name:
  //       val = [FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s"))];
  //       break;
  //     case InputFormatType.email:
  //       val = [FilteringTextInputFormatter.deny(RegExp(r'[- /+?:;*#$%^&()]'))];
  //       break;
  //   }
  //   return val;
  // }

  // static String? validateOTPCode(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return StringConstants.enterEmailCode;
  //   } else if (value.length != 6) {
  //     return StringConstants.otpCodeError;
  //   }
  //   return null;
  // }

  // static String? validateName(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return StringConstants.enterNameMsg;
  //   } else if (value.length < 3) {
  //     return StringConstants.nameValidatorMsg(3);
  //   }
  //   return null;
  // }
}
