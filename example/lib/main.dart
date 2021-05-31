import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:ed25519_lib/ed25519_lib.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _platformVersion;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    var platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    Uint8List publicKey = new Uint8List.fromList(bigIntToUint8List(BigInt.parse(
        "0x4cc083df81a82e1ef7d22b72614703fbcb451f7902a6c865bfb3309e9f311556")));
    Uint8List msg =
        new Uint8List.fromList(utf8.encode("Aviv Eyal avive@spacemesh.io"));
    Uint8List sig = new Uint8List.fromList(bigIntToUint8List(BigInt.parse(
        "0xb71ae47c5df50e8979996ebf0a4c8e9d6f8e60580a44859093f7bf5649bc32ba6d73c990d263978d79a57e13cf46606352cc285bb718c23aa75a6339ef45720e")));

    try {
      platformVersion = await Ed25519Lib.verify2(publicKey, msg, sig) ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Center(
            child: Column(children: [
              Spacer(flex: 5),
              Text(
                'Use spacemesh ed25519 go implementation to verify the following message:',
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Text(
                  "{`text`: `Aviv Eyal avive@spacemesh.io`,`signature`: '0xb71ae47c5df50e8979996ebf0a4c8e9d6f8e60580a44859093f7bf5649bc32ba6d73c990d263978d79a57e13cf46606352cc285bb718c23aa75a6339ef45720e',`publicKey`: '0x4cc083df81a82e1ef7d22b72614703fbcb451f7902a6c865bfb3309e9f311556'}"),
              Spacer(),
              Text(
                "Result of ed25519_verify: $_platformVersion\n",
                textAlign: TextAlign.center,
              ),
              Spacer(flex: 5),
            ]),
          )),
    );
  }

  Uint8List bigIntToUint8List(BigInt bigInt) =>
      bigIntToByteData(bigInt).buffer.asUint8List();

  ByteData bigIntToByteData(BigInt bigInt) {
    final data = ByteData((bigInt.bitLength / 8).ceil());
    var _bigInt = bigInt;

    for (var i = 1; i <= data.lengthInBytes; i++) {
      data.setUint8(data.lengthInBytes - i, _bigInt.toUnsigned(8).toInt());
      _bigInt = _bigInt >> 8;
    }

    return data;
  }
}
