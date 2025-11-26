import 'package:flutter/material.dart';
import 'package:native_channel/features/battery_percentage/view/battery_percentage.dart';
import 'package:native_channel/features/flashlight/view/flashlight_view.dart';
import 'package:native_channel/features/ringtone/view/ringtone_view.dart';
import 'package:native_channel/features/vibration/view/vibration_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Native Channel",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BatteryPercentage(),
                SizedBox(height: 12),
                FlashlightView(),
                SizedBox(height: 12),
                VibrationView(),
                SizedBox(
                  height: 12,
                ),
                RingtoneScreen()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
