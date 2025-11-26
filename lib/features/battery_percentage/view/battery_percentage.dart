import 'package:flutter/material.dart';
import 'package:native_channel/features/battery_percentage/view_model/battery_viewmodel.dart';
import 'package:provider/provider.dart';

class BatteryPercentage extends StatelessWidget {
  const BatteryPercentage({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<BatteryViewmodel>(
            builder: (context, vm, _) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Battery Percentage",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  ElevatedButton(
                    onPressed: vm.loading ? null : vm.getBatteryLevel,
                    child: vm.loading
                        ? const SizedBox(
                            height: 18,
                            width: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text("Check Battery"),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    vm.batteryPercentage == null
                        ? "Battery not checked yet"
                        : "Battery: ${vm.batteryPercentage}%",
                    style: const TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
