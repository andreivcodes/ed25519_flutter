import Flutter
import UIKit
import Ed25519

public class SwiftEd25519LibPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "ed25519_lib", binaryMessenger: registrar.messenger())
    let instance = SwiftEd25519LibPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch  call.method {
      case "Ed25519ExtractPublicKey":
        guard let arguments = call.arguments as? [String:FlutterStandardTypedData],
        let message:FlutterStandardTypedData = arguments["message"],
        let sig:FlutterStandardTypedData = arguments["sig"]
        else {
          result("Wrong arguments")
          return
        }
        result(Ed25519.Ed25519ExtractPublicKey(message.data,sig.data))

      case "Ed25519Sign2":
        guard let arguments = call.arguments as? [String:FlutterStandardTypedData],
        let privateKey:FlutterStandardTypedData = arguments["privateKey"],
        let message:FlutterStandardTypedData = arguments["message"]
        else {
          result("Wrong arguments")
          return
        }
        result(Ed25519.Ed25519Sign2(privateKey.data,message.data))

      case "Ed25519Verify2":
        guard let arguments = call.arguments as? [String:FlutterStandardTypedData],
        let publicKey:FlutterStandardTypedData = arguments["publicKey"],
        let message:FlutterStandardTypedData = arguments["message"],
        let sig:FlutterStandardTypedData = arguments["sig"]
        else {
          result("Wrong arguments")
          return
        }
        result(Ed25519.Ed25519Verify2(publicKey.data,message.data,sig.data))

      default:
        result("err")
    } 
  }
}