import 'package:flutter/material.dart';
import 'package:nudge_test/model/device_info_model.dart';
import 'package:nudge_test/utils/device_info.dart';


class DeviceInfoViewModel extends ChangeNotifier {
  final DeviceInfo _deviceInfo = DeviceInfo();

 late DeviceInfoModel _deviceInfoModel;
  DeviceInfoModel get deviceInfoModel => _deviceInfoModel;

  Future<void> loadDeviceInfo() async {
    try {
     final info = DeviceInfoModel(
        timezone: await _deviceInfo.getTimezone(),
        internetState: await _deviceInfo.getInternetState() ?? false,
        brand: await _deviceInfo.getBrand() ?? '',
        model: await _deviceInfo.getModel() ?? '',
        deviceLanguage: await _deviceInfo.getDeviceLanguage() ?? '',
        appVersion: await _deviceInfo.getAppVersion() ?? '',
        batteryLevel: await _deviceInfo.getBatteryLevel() ?? -1,
        os: await _deviceInfo.getOS() ?? '',
        osVersion: await _deviceInfo.getOSVersion() ?? '',
        buildMode: await _deviceInfo.getBuildMode() ?? '',
        height: await _deviceInfo.getHeight() ?? 0,
        width: await _deviceInfo.getWidth() ?? 0,
      );

      _deviceInfoModel = info;

      notifyListeners();
    } catch (e) {
      print("Failed to load device info: $e");
    }
  }
}
