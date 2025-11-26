import 'package:flutter/material.dart';
import 'package:native_channel/features/flashlight/view_model/flashlight_viewmodel.dart';
import 'package:provider/provider.dart';

class FlashlightView extends StatelessWidget {
  const FlashlightView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashlightViewmodel>(
      builder: (context, vm, _) {
        return Card(
          margin: const EdgeInsets.all(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Flashlight",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: vm.loading ? null : vm.toogleTorch,
                  child: vm.loading
                      ? const SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(vm.isFlashOn ? "Turn OFF" : "Turn ON"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
