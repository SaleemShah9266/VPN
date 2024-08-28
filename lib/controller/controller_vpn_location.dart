import 'package:get/get.dart';
import 'package:vpn/ApiVpnGet/api_vpn__gate.dart';
import 'package:vpn/Models/vpn_info.dart';
import 'package:vpn/appPreferences/preferences.dart';

class ControllerVPNLocation extends GetxController
{
  List<VpnInfo> vpnFreeServersAvailableList = AppPreferences.vpnList;
  final RxBool isLoadingNewLocation = false.obs;
  Future<void> retrieveVpnInformation() async
  {
    isLoadingNewLocation.value = true;

    vpnFreeServersAvailableList.clear();
    vpnFreeServersAvailableList = await ApiVpnGate.retrieveAllAvailableFreeVpnServers();
    isLoadingNewLocation.value = false;
  }
}