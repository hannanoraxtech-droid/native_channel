package com.example.native_channel

import android.os.BatteryManager
import android.content.Context
import android.hardware.camera2.CameraManager
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.os.Vibrator
import android.os.VibrationEffect
import android.media.Ringtone
import android.media.RingtoneManager
import android.net.Uri

class MainActivity : FlutterActivity() {

    private val BATTERY_CHANNEL = "native_channel/battery_percentage"
    private val FLASH_CHANNEL = "native_channel/flashlight"
    private val VIBRATION_CHANNEL = "native_channel/vibration"
    private val RINGTONE_CHANNEL = "native_channel/ringtone"

    private var ringtone: Ringtone? = null   // IMPORTANT — required for ringtone

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // -------------------------- BATTERY CHANNEL --------------------------
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, BATTERY_CHANNEL)
            .setMethodCallHandler { call, result ->
                if (call.method == "getBatteryLevel") {
                    val batteryLevel = getBatteryLevel()
                    if (batteryLevel != -1) {
                        result.success(batteryLevel)
                    } else {
                        result.error("UNAVAILABLE", "Battery level not available", null)
                    }
                } else {
                    result.notImplemented()
                }
            }

        // -------------------------- FLASHLIGHT CHANNEL --------------------------
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, FLASH_CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "turnonFlash" -> {
                        toggleFlash(true)
                        result.success(null)
                    }
                    "turnoffFlash" -> {
                        toggleFlash(false)
                        result.success(null)
                    }
                    else -> result.notImplemented()
                }
            }

        // -------------------------- VIBRATION CHANNEL --------------------------
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, VIBRATION_CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "vibrateOnce" -> {
                        val duration = call.argument<Int>("duration") ?: 300
                        vibrateOnce(duration)
                        result.success(null)
                    }
                    "stopVibration" -> {
                        stopVibration()
                        result.success(null)
                    }
                    else -> result.notImplemented()
                }
            }

        // -------------------------- RINGTONE CHANNEL --------------------------
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, RINGTONE_CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "startRinging" -> {
                        playRingtone()
                        result.success(null)
                    }
                    "stopRinging" -> {
                        stopRingtone()
                        result.success(null)
                    }
                    else -> result.notImplemented()
                }
            }
    }

    // -------------------------- BATTERY FUNCTION --------------------------
    private fun getBatteryLevel(): Int {
        val manager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
        return manager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
    }

    // -------------------------- FLASHLIGHT FUNCTION --------------------------
    private fun toggleFlash(status: Boolean) {
        val cameraManager = getSystemService(Context.CAMERA_SERVICE) as CameraManager
        val cameraId = cameraManager.cameraIdList[0]
        cameraManager.setTorchMode(cameraId, status)
    }

    // -------------------------- VIBRATION FUNCTIONS --------------------------
    private fun vibrateOnce(duration: Int) {
        val vibrator = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator
        vibrator.vibrate(
            VibrationEffect.createOneShot(
                duration.toLong(),
                VibrationEffect.DEFAULT_AMPLITUDE
            )
        )
    }

    private fun stopVibration() {
        val vibrator = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator
        vibrator.cancel()
    }

    // -------------------------- RINGTONE FUNCTIONS --------------------------
    private fun playRingtone() {
        if (ringtone == null) {
            val uri: Uri = RingtoneManager.getDefaultUri(RingtoneManager.TYPE_RINGTONE)
            ringtone = RingtoneManager.getRingtone(applicationContext, uri)
        }
        ringtone?.play()
    }

    private fun stopRingtone() {
        if (ringtone?.isPlaying == true) {
            ringtone?.stop()
        }
    }
}
