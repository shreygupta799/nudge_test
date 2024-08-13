import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:nudge_test/model/device_info_model.dart';
import '../utils/device_info.dart';

class DeviceInfoViewModel extends ChangeNotifier {
  final DeviceInfo _deviceInfo = DeviceInfo();
  DeviceInfoModel? _deviceInfoModel;

  DeviceInfoModel? get deviceInfoModel => _deviceInfoModel;

  Future<void> fetchDeviceInfo() async {
    final info = DeviceInfoModel(
      timezone: await _deviceInfo.getTimeZone(),
      internetState: await _deviceInfo.getInternetState(),
      brand: await _deviceInfo.getBrand(),
      model: await _deviceInfo.getModel(),
      deviceLanguage: _deviceInfo.getDeviceLanguage(),
      appVersion: _deviceInfo.getAppVersion(),
      batteryLevel: await _deviceInfo.getBatteryLevel(),
      os: _deviceInfo.getOS(),
      osVersion: await _deviceInfo.getOSVersion(),
      buildMode: _deviceInfo.getBuildMode(),
      height: _deviceInfo.getScreenHeight(),
      width: _deviceInfo.getScreenWidth(),
    );
    _deviceInfoModel = info;
    notifyListeners();
  }
}
