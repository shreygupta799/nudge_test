import 'package:flutter/material.dart';
import 'package:nudge_test/view_model/device_info_view_model.dart';

class DeviceInfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<DeviceInfoViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Device Information"),
      ),
      body: viewModel.deviceInfoModel == null
          ? Center(
              child: ElevatedButton(
                onPressed: () => viewModel.fetchDeviceInfo(),
                child: Text("Fetch Device Info"),
              ),
            )
          : ListView(
              children: [
                ListTile(
                  title: Text("Timezone"),
                  subtitle: Text(viewModel.deviceInfoModel!.timezone),
                ),
                ListTile(
                  title: Text("Internet State"),
                  subtitle: Text(viewModel.deviceInfoModel!.internetState),
                ),
                ListTile(
                  title: Text("Brand"),
                  subtitle: Text(viewModel.deviceInfoModel!.brand),
                ),
                ListTile(
                  title: Text("Model"),
                  subtitle: Text(viewModel.deviceInfoModel!.model),
                ),
                ListTile(
                  title: Text("Device Language"),
                  subtitle: Text(viewModel.deviceInfoModel!.deviceLanguage),
                ),
                ListTile(
                  title: Text("App Version"),
                  subtitle: Text(viewModel.deviceInfoModel!.appVersion),
                ),
                ListTile(
                  title: Text("Battery Level"),
                  subtitle:
                      Text(viewModel.deviceInfoModel!.batteryLevel.toString()),
                ),
                ListTile(
                  title: Text("OS"),
                  subtitle: Text(viewModel.deviceInfoModel!.os),
                ),
                ListTile(
                  title: Text("OS Version"),
                  subtitle: Text(viewModel.deviceInfoModel!.osVersion),
                ),
                ListTile(
                  title: Text("Build Mode"),
                  subtitle: Text(viewModel.deviceInfoModel!.buildMode),
                ),
                ListTile(
                  title: Text("Screen Height"),
                  subtitle: Text(viewModel.deviceInfoModel!.height.toString()),
                ),
                ListTile(
                  title: Text("Screen Width"),
                  subtitle: Text(viewModel.deviceInfoModel!.width.toString()),
                ),
              ],
            ),
    );
  }
}
