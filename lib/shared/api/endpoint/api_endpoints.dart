class ApiEndpoints {
  ApiEndpoints._();

  static String phoneLogin =
      'auth/registration-otp-codes/actions/phone/send-otp';
  static String verifyOTP =
      'auth/registration-otp-codes/actions/phone/verify-otp';

  static String users = 'chat/chat-messages/queries/contact-users';
  static String chatMessage(int custId, int userId) =>
      'chat/chat-messages/queries/chat-between-users/$custId/$userId';
}
