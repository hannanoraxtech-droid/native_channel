import 'package:flutter/material.dart';
import 'package:native_channel/features/vibration/viewmodel/vibration_viewmodel.dart';
import 'package:provider/provider.dart';

class VibrationView extends StatelessWidget {
  const VibrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<VibrationViewmodel>(
      builder: (context, vm, _) {
        return Card(
          margin: const EdgeInsets.all(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text(
                  "Vibration",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: vm.loading ? null : vm.startVibration,
                  child: vm.loading
                      ? const CircularProgressIndicator()
                      : const Text("Vibrate"),
                ),
                const SizedBox(height: 8),
                if (vm.vibrating)
                  ElevatedButton(
                    onPressed: vm.stopVibration,
                    child: const Text("Stop"),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
