import 'package:flutter/material.dart';
import 'package:native_channel/features/vibration/services/vibration_channel.dart';

class VibrationViewmodel extends ChangeNotifier {
  bool loading = false;
  bool vibrating = false;

  Future<void> startVibration() async {
    loading = true;
    notifyListeners();
    await VibrationChannel.vibrateOnce(5000);
    vibrating = true;

    loading = false;
    notifyListeners();
  }

  Future<void> stopVibration() async {
    loading = true;
    notifyListeners();
    await VibrationChannel.stopVibration();
    loading = false;
    notifyListeners();
  }
}
