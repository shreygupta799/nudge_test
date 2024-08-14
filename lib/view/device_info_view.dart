// views/device_info_screen.dart

import 'package:flutter/material.dart';
import 'package:nudge_test/model/device_info_model.dart';
import 'package:nudge_test/view_model/device_info_view_model.dart';

class DeviceInfoScreen extends StatefulWidget {
  @override
  _DeviceInfoScreenState createState() => _DeviceInfoScreenState();
}

class _DeviceInfoScreenState extends State<DeviceInfoScreen> {
  final DeviceInfoViewModel _viewModel = DeviceInfoViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.loadDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Device Information"),
      ),
      body: FutureBuilder<void>(
        future: _viewModel.loadDeviceInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return _buildDeviceInfo(_viewModel.deviceInfoModel);
          }
        },
      ),
    );
  }

  Widget _buildDeviceInfo(DeviceInfoModel? deviceInfo) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow("Timezone", deviceInfo?.timezone),
          _buildInfoRow("Internet State", deviceInfo?.internetState.toString()),
          _buildInfoRow("Brand", deviceInfo?.brand),
          _buildInfoRow("Model", deviceInfo?.model),
          _buildInfoRow("Device Language", deviceInfo?.deviceLanguage),
          _buildInfoRow("App Version", deviceInfo?.appVersion),
          _buildInfoRow("Battery Level", deviceInfo?.batteryLevel.toString()),
          _buildInfoRow("OS", deviceInfo?.os),
          _buildInfoRow("OS Version", deviceInfo?.osVersion),
          _buildInfoRow("Build Mode", deviceInfo?.buildMode),
          _buildInfoRow("Height", deviceInfo?.height.toString()),
          _buildInfoRow("Width", deviceInfo?.width.toString()),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(value ?? "Unknown"),
        ],
      ),
    );
  }
}
