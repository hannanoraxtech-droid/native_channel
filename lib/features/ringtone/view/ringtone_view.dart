import 'package:flutter/material.dart';
import 'package:native_channel/features/ringtone/viewmodel/ringtone_view_model.dart';
import 'package:provider/provider.dart';

class RingtoneScreen extends StatelessWidget {
  const RingtoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RingtoneViewModel(),
      child: Consumer<RingtoneViewModel>(
        builder: (context, vm, _) {
          return Card(
            margin: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Ringtone Trigger",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: vm.isRinging ? vm.stopRinging : vm.startRinging,
                    child:
                        Text(vm.isRinging ? "Stop Ringtone" : "Play Ringtone"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
