import 'package:flutter/material.dart';
import 'package:native_channel/features/battery_percentage/services/battery_percentage_channel.dart';

class BatteryViewmodel extends ChangeNotifier {
  int? batteryPercentage;
  bool loading = false;
  Future<void> getBatteryLevel() async {
    loading = true;
    notifyListeners();
    batteryPercentage = await BatteryPercentageChannel.getBatteryLevel();

    loading = false;
    notifyListeners();
  }
}
