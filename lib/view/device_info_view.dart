import 'package:flutter/material.dart';
import 'package:nudge_test/view_model/device_info_view_model.dart';
import 'package:provider/provider.dart';


class DeviceInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DeviceInfoViewModel()..loadDeviceInfo(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Device Information'),
        ),
        body: Consumer<DeviceInfoViewModel>(
          builder: (context, viewModel, child) {
            final deviceInfoModel = viewModel.deviceInfoModel;

            if (deviceInfoModel == null) {
              return Center(child: CircularProgressIndicator());
            }

            return ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                Text('Timezone: ${deviceInfoModel.timezone ?? 'N/A'}'),
                Text('Internet State: ${deviceInfoModel.internetState ? 'Connected' : 'Disconnected'}'),
                Text('Brand: ${deviceInfoModel.brand}'),
                Text('Model: ${deviceInfoModel.model}'),
                Text('Device Language: ${deviceInfoModel.deviceLanguage}'),
                Text('App Version: ${deviceInfoModel.appVersion}'),
                Text('Battery Level: ${deviceInfoModel.batteryLevel}'),
                Text('OS: ${deviceInfoModel.os}'),
                Text('OS Version: ${deviceInfoModel.osVersion}'),
                Text('Build Mode: ${deviceInfoModel.buildMode}'),
                Text('Height: ${deviceInfoModel.height} pixels'),
                Text('Width: ${deviceInfoModel.width} pixels'),
              ],
            );
          },
        ),
      ),
    );
  }
}
