import 'package:flutter/material.dart';
import 'package:native_channel/features/flashlight/services/flashlight_channel.dart';

class FlashlightViewmodel extends ChangeNotifier {
  bool isFlashOn = false;
  bool loading = false;

  Future<void> toogleTorch() async {
    loading = true;
    notifyListeners();

    if (isFlashOn) {
      await FlashlightChannel.trunoff();
      isFlashOn = false;
    } else {
      await FlashlightChannel.turnon();
      isFlashOn = true;
    }
    loading = false;
    notifyListeners();
  }
}
