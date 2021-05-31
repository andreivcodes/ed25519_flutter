
import 'dart:async';

import 'package:flutter/services.dart';

class Ed25519Lib {
  static const MethodChannel _channel =
      const MethodChannel('ed25519_lib');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
