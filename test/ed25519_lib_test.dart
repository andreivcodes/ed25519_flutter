import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ed25519_lib/ed25519_lib.dart';

void main() {
  const MethodChannel channel = MethodChannel('ed25519_lib');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Ed25519Lib.platformVersion, '42');
  });
}
