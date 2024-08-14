class DeviceInfoModel {
  final String? timezone;
  final bool internetState;
  final String brand;
  final String model;
  final String deviceLanguage;
  final String appVersion;
  final int batteryLevel;
  final String os;
  final String osVersion;
  final String buildMode;
  final int height;
  final int width;

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

  factory DeviceInfoModel.fromMap(Map<String, dynamic> map) {
    return DeviceInfoModel(
      timezone: map['timezone'] as String?,
      internetState: map['internetState'] as bool,
      brand: map['brand'] as String,
      model: map['model'] as String,
      deviceLanguage: map['deviceLanguage'] as String,
      appVersion: map['appVersion'] as String,
      batteryLevel: map['batteryLevel'] as int,
      os: map['os'] as String,
      osVersion: map['osVersion'] as String,
      buildMode: map['buildMode'] as String,
      height: (map['height'] as num).toInt(),
      width: (map['width'] as num).toInt(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'timezone': timezone,
      'internetState': internetState,
      'brand': brand,
      'model': model,
      'deviceLanguage': deviceLanguage,
      'appVersion': appVersion,
      'batteryLevel': batteryLevel,
      'os': os,
      'osVersion': osVersion,
      'buildMode': buildMode,
      'height': height,
      'width': width,
    };
  }
}
