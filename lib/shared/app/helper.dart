import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Helper {
  static void afterInit(Function function) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      function();
    });
  }

  Map<String, dynamic> removeNullValues(Map<String, dynamic> input) {
    return Map.fromEntries(input.entries.where((e) => e.value != null));
  }

  static Future<Map<String, dynamic>> getDeviceMeta() async {
    final deviceInfo = DeviceInfoPlugin();
    final packageInfo = await PackageInfo.fromPlatform();

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      return {
        'type': 'mobile',
        'device-name': androidInfo.model,
        'device-os-version': 'Android ${androidInfo.version.release}',
        'browser': packageInfo.appName,
        'browser_version': packageInfo.version,
        'user-agent': 'Android/${androidInfo.version.release}',
        'screen_resolution': androidInfo.display,
        'language': Platform.localeName,
      };
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      return {
        'type': 'mobile',
        'device-name': iosInfo.model,
        'device-os-version': 'iOS ${iosInfo.systemVersion}',
        'browser': packageInfo.appName,
        'browser_version': packageInfo.version,
        'user-agent': 'iOS/${iosInfo.systemVersion}',
        'screen_resolution': iosInfo.model,
        'language': Platform.localeName,
      };
    }

    return {
      'type': 'mobile',
      'device-name': 'Unknown',
      'device-os-version': 'Unknown',
      'browser': packageInfo.appName,
      'browser_version': packageInfo.version,
      'user-agent': 'Flutter App',
      'screen_resolution': 'Unknown',
      'language': Platform.localeName,
    };
  }

  static String? validatePhoneNumber(String phone) {
    if (phone.isEmpty) {
      return 'Phone number is required';
    }
    if (phone.length != 10) {
      return 'Phone number must be 10 digits';
    }
    if (!RegExp(r'^[6-9][0-9]{9}$').hasMatch(phone)) {
      return 'Please enter a valid Indian mobile number';
    }
    return null;
  }

  static void showValidationError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
