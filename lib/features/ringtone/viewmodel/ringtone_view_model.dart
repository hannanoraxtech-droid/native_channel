import 'package:flutter/material.dart';
import 'package:native_channel/features/ringtone/services/services_channel.dart';

class RingtoneViewModel extends ChangeNotifier {
  bool isRinging = false;
  Future<void> startRinging() async {
    await ServicesChannel.playRingtone();
    isRinging = true;
    notifyListeners();
  }

  Future<void> stopRinging() async {
    await ServicesChannel.stopRingtone();
    isRinging = false;
    notifyListeners();
  }
}
