import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn/Models/vpn_loction_card_widget.dart';
import 'package:vpn/controller/controller_vpn_location.dart';

class AvailableVpnServersLocation extends StatelessWidget {
  AvailableVpnServersLocation({super.key});

  final vpnLocationController = Get.put(ControllerVPNLocation());

  @override
  Widget build(BuildContext context) {
    if (vpnLocationController.vpnFreeServersAvailableList.isEmpty) {
      vpnLocationController.retrieveVpnInformation();
    }

    return Obx(() => Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          "VPN location (${vpnLocationController.vpnFreeServersAvailableList.length})",
        ),
      ),
      body: vpnLocationController.isLoadingNewLocation.value
          ? loadingUIWidget()
          : vpnLocationController.vpnFreeServersAvailableList.isEmpty
          ? noVpnServerFoundUIWidget()
          : vpnAvailableServerData(),
    ));
  }

  Widget loadingUIWidget() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
          ),
          SizedBox(height: 8),
          Text(
            "Gathering Free VPN Location....",
            style: TextStyle(
                fontSize: 16, color: Colors.black54, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget noVpnServerFoundUIWidget() {
    return Center(
      child: Text(
        "No VPN server found....",
        style: TextStyle(
            fontSize: 18, color: Colors.black54, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget vpnAvailableServerData() {
    return ListView.builder(
      itemCount: vpnLocationController.vpnFreeServersAvailableList.length,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(3),
      itemBuilder: (context, index) {
        return VpnLocationCardWidget(
            vpnInfo: vpnLocationController.vpnFreeServersAvailableList[index]);
      },
    );
  }
}
