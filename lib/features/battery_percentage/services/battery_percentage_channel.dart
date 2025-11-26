import 'package:flutter/services.dart';

class BatteryPercentageChannel {
  static const MethodChannel _methodChannel =
      MethodChannel("native_channel/battery_percentage");
  static Future<int> getBatteryLevel() async {
    final level = await _methodChannel.invokeMethod("getBatteryLevel");
    return level;
  }
}
