import 'package:flutter/material.dart';
import 'package:nudge_test/model/device_info_model.dart';
import 'package:nudge_test/utils/device_info.dart';


class DeviceInfoViewModel extends ChangeNotifier {
  final DeviceInfo _deviceInfo = DeviceInfo();

  DeviceInfoModel? _deviceInfoModel;
  DeviceInfoModel? get deviceInfoModel => _deviceInfoModel;

  Future<void> loadDeviceInfo() async {
    try {
      final String? timezone = await _deviceInfo.getTimezone();
      final bool? internetState = await _deviceInfo.getInternetState();
      final String? brand = await _deviceInfo.getBrand();
      final String? model = await _deviceInfo.getModel();
      final String? deviceLanguage = await _deviceInfo.getDeviceLanguage();
      final String? appVersion = await _deviceInfo.getAppVersion();
      final int? batteryLevel = await _deviceInfo.getBatteryLevel();
      final String? os = await _deviceInfo.getOS();
      final String? osVersion = await _deviceInfo.getOSVersion();
      final String? buildMode = await _deviceInfo.getBuildMode();
      final int? height = await _deviceInfo.getHeight();
      final int? width = await _deviceInfo.getWidth();

      _deviceInfoModel = DeviceInfoModel(
        timezone: timezone,
        internetState: internetState ?? false,
        brand: brand ?? '',
        model: model ?? '',
        deviceLanguage: deviceLanguage ?? '',
        appVersion: appVersion ?? '',
        batteryLevel: batteryLevel ?? -1,
        os: os ?? '',
        osVersion: osVersion ?? '',
        buildMode: buildMode ?? '',
        height: height?.toDouble() ?? 0.0,
        width: width?.toDouble() ?? 0.0,
      );

      notifyListeners();
    } catch (e) {
      print("Failed to load device info: $e");
    }
  }
}
