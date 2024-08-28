class VpnInfo {
  late final String hostname;
  late final String ip;
  late final String ping;
  late final int speed;
  late final String countryLongName;
  late final String countryShortName;
  late final int vpnSessionNum;
  late final String base64OpenVPNConfigurationData;

  VpnInfo({
    required this.hostname,
    required this.ip,
    required this.ping,
    required this.speed,
    required this.countryLongName,
    required this.countryShortName,
    required this.vpnSessionNum,
    required this.base64OpenVPNConfigurationData,
  });

  VpnInfo.fromJson(Map<String, dynamic> jsonData) {
    hostname = jsonData["HostName"]?.toString() ?? "";
    ip = jsonData["IP"]?.toString() ?? "";
    ping = jsonData["Ping"]?.toString() ?? ""; // Convert to String
    speed = jsonData["Speed"]?.toInt() ?? 0; // Convert to int
    countryLongName = jsonData['CountryLong']?.toString() ?? "";
    countryShortName = jsonData['CountryShort']?.toString() ?? "";
    vpnSessionNum = jsonData['NumVpnSession']?.toInt() ?? 0; // Convert to int
    base64OpenVPNConfigurationData = jsonData['OpenVPN_ConfigData_Base64']?.toString() ?? "";
  }

  Map<String, dynamic> toJson() {
    final jsonData = <String, dynamic>{};
    jsonData["HostName"] = hostname;
    jsonData["IP"] = ip;
    jsonData["Ping"] = ping; // Ensure this is a string if required
    jsonData["Speed"] = speed;
    jsonData["CountryLong"] = countryLongName;
    jsonData["CountryShort"] = countryShortName;
    jsonData["NumVpnSession"] = vpnSessionNum;
    jsonData["OpenVPN_ConfigData_Base64"] = base64OpenVPNConfigurationData;

    return jsonData;
  }
}
