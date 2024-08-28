import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn/Models/vpn_configuration.dart';
import 'package:vpn/Models/vpn_info.dart';
import 'package:vpn/appPreferences/preferences.dart';
import 'package:vpn/vpn_engine/vpn_engine.dart';

class ControllerHome extends GetxController {
  final Rx<VpnInfo> vpnInfo = AppPreferences.vpnInfoObj.obs;
  final vpnConnectionState = VpnEngine.vpnDisconnectedNow.obs;

  void connectToVpnNow() async {
    if (vpnInfo.value.base64OpenVPNConfigurationData.isEmpty) {
      Get.snackbar("Country / Location", "Please select country / location first ");
      return;
    }

    // If the VPN is in disconnected mode
    if (vpnConnectionState.value == VpnEngine.vpnDisconnectedNow) {
      final dataConfigVpn = Base64Decoder().convert(vpnInfo.value.base64OpenVPNConfigurationData);
      final configuration = Utf8Decoder().convert(dataConfigVpn);

      final vpnConfiguration = VpnConfiguration(
        username: "vpn",
        password: "vpn",
        countryName: vpnInfo.value.countryLongName,
        config: configuration,
      );

      await VpnEngine.startVpnNow(vpnConfiguration);
    } else {
      await VpnEngine.stopVpnNow();
    }
  }

  Color get getRoundButtonColor {
    switch (vpnConnectionState.value) {
      case VpnEngine.vpnDisconnectedNow:
        return Colors.redAccent;
      case VpnEngine.vpnReconnectNow:
        return Colors.green;
      default:
        return Colors.orangeAccent;
    }
  }

  String get getRoundedButtonText {
    switch (vpnConnectionState.value) {
      case VpnEngine.vpnDisconnectedNow:
        return "Tap to connect";
      case VpnEngine.vpnReconnectNow:
        return "Disconnect";
      default:
        return "Connecting...";
    }
  }
}  // <--- Add this closing brace
