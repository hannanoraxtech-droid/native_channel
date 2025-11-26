import 'package:flutter/material.dart';
import 'package:native_channel/features/battery_percentage/view_model/battery_viewmodel.dart';
import 'package:native_channel/features/flashlight/view_model/flashlight_viewmodel.dart';
import 'package:native_channel/features/ringtone/viewmodel/ringtone_view_model.dart';
import 'package:native_channel/features/vibration/viewmodel/vibration_viewmodel.dart';
import 'package:native_channel/screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BatteryViewmodel()),
        ChangeNotifierProvider(create: (_) => FlashlightViewmodel()),
        ChangeNotifierProvider(create: (_) => VibrationViewmodel()),
        ChangeNotifierProvider(create: (_) => RingtoneViewModel())
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: HomeScreen()),
    );
  }
}
