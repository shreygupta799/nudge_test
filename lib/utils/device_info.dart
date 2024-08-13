import 'dart:async';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

class DeviceInfo {
  static const MethodChannel _channel =
      MethodChannel('com.example.device_info/info');

  Future<String> getTimeZone() async {
    return DateTime.now().timeZoneName;
  }

  Future<String> getInternetState() async {
    try {
      final bool isConnected = await _channel.invokeMethod('getInternetState');
      return isConnected ? 'Connected' : 'Disconnected';
    } on PlatformException catch (e) {
      return 'Failed to get network state: ${e.message}';
    }
  }

  Future<String> getBrand() async {
    return await _channel.invokeMethod('getBrand');
  }

  Future<String> getModel() async {
    return await _channel.invokeMethod('getModel');
  }

  String getDeviceLanguage() {
    return window.locale.languageCode;
  }

  String getAppVersion() {
    // Implement logic to get app version
    return "1.0.0"; // Placeholder
  }

  Future<int> getBatteryLevel() async {
    try {
      final int batteryLevel = await _channel.invokeMethod('getBatteryLevel');
      return batteryLevel;
    } on PlatformException catch (e) {
      return -1;
    }
  }

  String getOS() {
    return "Android";
  }

  Future<String> getOSVersion() async {
    return await _channel.invokeMethod('getOSVersion');
  }

  String getBuildMode() {
    if (kReleaseMode) return 'Release';
    if (kDebugMode) return 'Debug';
    return 'Profile';
  }

  double getScreenHeight() {
    return window.physicalSize.height / window.devicePixelRatio;
  }

  double getScreenWidth() {
    return window.physicalSize.width / window.devicePixelRatio;
  }
}
