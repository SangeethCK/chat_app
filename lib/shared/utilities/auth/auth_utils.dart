import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthUtils {
  AuthUtils._();
  static AuthUtils? _instance;
  static final AuthUtils instance = (_instance ??= AuthUtils._());

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // Future<void> writeUserData(LoginResponse user) async {
  //   try {
  //     final String userJson = jsonEncode(user.toJson());

  //     await _secureStorage.write(key: 'user', value: userJson);
  //     log("User data written: $userJson");
  //   } catch (e) {
  //     log("Error saving user data: $e");
  //   }
  // }

  // Future<LoginResponse?> readUserData() async {
  //   try {
  //     final String? userData = await _secureStorage.read(key: 'user');
  //     if (userData != null) {
  //       final Map<String, dynamic> userMap = jsonDecode(userData);

  //       return LoginResponse.fromJson(userMap);
  //     }
  //     return null;
  //   } catch (e) {
  //     log("Error reading user data: $e");
  //     return null;
  //   }
  // }

  Future<void> writeAccessTokens(String token) async {
    await _writeSecurely('access_token', token);
  }

  Future<String?> get readAccessToken async {
    return await _secureStorage.read(key: 'access_token');
  }

  Future<bool> get isSignedIn async {
    final String? data = await _secureStorage.read(key: 'access_token');

    if (data != null) {
      return true;
    }

    return false;
  }

  Future<void> get deleteTokens async {
    await _secureStorage.deleteAll();
  }

  Future<void> _writeSecurely(String key, String value) async {
    try {
      await _secureStorage.write(key: key, value: value);
    } catch (e) {
      if (e is PlatformException && e.code == '-25299') {
        await _secureStorage.delete(key: key);
        await _secureStorage.write(key: key, value: value);
      } else {
        rethrow;
      }
    }
  }
}
