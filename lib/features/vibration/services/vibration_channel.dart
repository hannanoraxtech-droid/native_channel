import 'package:flutter/services.dart';

class VibrationChannel {
  static const MethodChannel _channel =
      MethodChannel("native_channel/vibration");
  static Future<void> vibrateOnce(int millisecond) async {
    await _channel.invokeMethod("vibrateOnce", {
      "duration": millisecond,
    });
  }

  static Future<void> stopVibration() async {
    await _channel.invokeMethod("stopVibration");
  }
}
