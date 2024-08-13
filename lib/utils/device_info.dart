import 'dart:async';
import 'package:flutter/services.dart';

class DeviceInfo {
  static const MethodChannel _channel = MethodChannel('com.example.device_info/info');

  Future<String?> getTimezone() async {
    try {
      final String? timezone = await _channel.invokeMethod('getTimezone');
      return timezone;
    } catch (e) {
      print("Failed to get timezone: $e");
      return null;
    }
  }

  Future<bool?> getInternetState() async {
    try {
      final bool? isConnected = await _channel.invokeMethod('getInternetState');
      return isConnected;
    } catch (e) {
      print("Failed to get internet state: $e");
      return null;
    }
  }

  Future<String?> getBrand() async {
    try {
      final String? brand = await _channel.invokeMethod('getBrand');
      return brand;
    } catch (e) {
      print("Failed to get brand: $e");
      return null;
    }
  }

  Future<String?> getModel() async {
    try {
      final String? model = await _channel.invokeMethod('getModel');
      return model;
    } catch (e) {
      print("Failed to get model: $e");
      return null;
    }
  }

  Future<String?> getDeviceLanguage() async {
    try {
      final String? language = await _channel.invokeMethod('getDeviceLanguage');
      return language;
    } catch (e) {
      print("Failed to get device language: $e");
      return null;
    }
  }

  Future<String?> getAppVersion() async {
    try {
      final String? version = await _channel.invokeMethod('getAppVersion');
      return version;
    } catch (e) {
      print("Failed to get app version: $e");
      return null;
    }
  }

  Future<int?> getBatteryLevel() async {
    try {
      final int? batteryLevel = await _channel.invokeMethod('getBatteryLevel');
      return batteryLevel;
    } catch (e) {
      print("Failed to get battery level: $e");
      return null;
    }
  }

  Future<String?> getOS() async {
    try {
      final String? os = await _channel.invokeMethod('getOS');
      return os;
    } catch (e) {
      print("Failed to get OS: $e");
      return null;
    }
  }

  Future<String?> getOSVersion() async {
    try {
      final String? osVersion = await _channel.invokeMethod('getOSVersion');
      return osVersion;
    } catch (e) {
      print("Failed to get OS version: $e");
      return null;
    }
  }

  Future<String?> getBuildMode() async {
    try {
      final String? buildMode = await _channel.invokeMethod('getBuildMode');
      return buildMode;
    } catch (e) {
      print("Failed to get build mode: $e");
      return null;
    }
  }

  Future<int?> getHeight() async {
    try {
      final int? height = await _channel.invokeMethod('getHeight');
      return height;
    } catch (e) {
      print("Failed to get height: $e");
      return null;
    }
  }

  Future<int?> getWidth() async {
    try {
      final int? width = await _channel.invokeMethod('getWidth');
      return width;
    } catch (e) {
      print("Failed to get width: $e");
      return null;
    }
  }
}
