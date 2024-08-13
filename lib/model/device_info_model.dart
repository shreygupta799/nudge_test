class DeviceInfoModel {
  final String timezone;
  final String internetState;
  final String brand;
  final String model;
  final String deviceLanguage;
  final String appVersion;
  final int batteryLevel;
  final String os;
  final String osVersion;
  final String buildMode;
  final double height;
  final double width;

  DeviceInfoModel({
    required this.timezone,
    required this.internetState,
    required this.brand,
    required this.model,
    required this.deviceLanguage,
    required this.appVersion,
    required this.batteryLevel,
    required this.os,
    required this.osVersion,
    required this.buildMode,
    required this.height,
    required this.width,
  });
}
