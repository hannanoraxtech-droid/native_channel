import 'package:flutter/services.dart';

class ServicesChannel {
  static const MethodChannel _channel =
      MethodChannel("native_channel/ringtone");
  static Future<void> playRingtone() async {
    await _channel.invokeMethod("startRinging");
  }

  static Future<void> stopRingtone() async {
    await _channel.invokeMethod("stopRinging");
  }
}
