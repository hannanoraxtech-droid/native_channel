import 'package:flutter/services.dart';

class FlashlightChannel {
  static const MethodChannel _channel =
      MethodChannel("native_channel/flashlight");
  static Future<void> trunoff() async {
    try {
      await _channel.invokeMethod("turnoffFlash");
    } catch (e) {
      // Log missing plugin or other platform errors; caller should handle any user-facing behavior
      // This avoids an unhandled exception during hot-reloads when native code isn't available.
      // ignore: avoid_print
      print('Flashlight trunoff failed: $e');
    }
  }

  static Future<void> turnon() async {
    try {
      await _channel.invokeMethod("turnonFlash");
    } catch (e) {
      // ignore: avoid_print
      print('Flashlight turnon failed: $e');
    }
  }
}
