import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/services.dart';

class Ed25519Lib {
  static const MethodChannel _channel = const MethodChannel('ed25519_lib');

  static Future<Uint8List?> extractPublicKey(
      Uint8List message, Uint8List sig) async {
    var argMap = <String, dynamic>{"message": message, "sig": sig};
    final Uint8List? result =
        await _channel.invokeMethod('Ed25519ExtractPublicKey', argMap);
    return result;
  }

  static Future<Uint8List?> sign2(
      Uint8List privateKey, Uint8List message) async {
    var argMap = <String, dynamic>{
      "privateKey": privateKey,
      "message": message
    };
    final Uint8List? result =
        await _channel.invokeMethod('Ed25519Sign2', argMap);
    return result;
  }

  static Future<bool?> verify2(
      Uint8List publicKey, Uint8List message, Uint8List sig) async {
    var argMap = <String, dynamic>{
      "publicKey": publicKey,
      "message": message,
      "sig": sig
    };
    final bool? result = await _channel.invokeMethod('Ed25519Verify2', argMap);
    return result;
  }

  static Future<Uint8List?> newDerivedKeyFromSeed(
      Uint8List seed, Uint8List index, Uint8List salt) async {
    var argMap = <String, dynamic>{"seed": seed, "index": index, "salt": salt};
    final Uint8List? result =
        await _channel.invokeMethod('Ed25519NewDerivedKeyFromSeed', argMap);
    return result;
  }
}
