
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vpn/Models/vpn_info.dart';
import 'package:vpn/controller/controller_home.dart';
import 'package:vpn/main.dart';

class VpnLocationCardWidget extends StatelessWidget {
  final VpnInfo vpnInfo;
 VpnLocationCardWidget({super.key,
 required this.vpnInfo,
 });

 String formatSpeedBytes(int speedBytes, int decimal){
   if(speedBytes <= 0){
     return "0 B";

   }
   const suffixedTitle = ["Bps","Kbps", "Mbps" ,"Gbps", "tBps"];

   var speedTitleIndex = (log(speedBytes)) / log(1024).floor();
   return "${(speedBytes/pow(1024, speedTitleIndex)).toStringAsFixed(decimal)} ${suffixedTitle[speedBytes]}";
 }


  @override
  Widget build(BuildContext context) {
    sizeScreen = MediaQuery.of(context).size;

    final homeController = Get.find<ControllerHome>();

    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(vertical:sizeScreen.height * .01 ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: (){},
        borderRadius: BorderRadius.circular(16),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          leading: Container(
            padding: EdgeInsets.all(0.5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset("countryFlags/${vpnInfo.countryShortName.toLowerCase()}.png",
            height: 40,width: sizeScreen.width * .15,
            fit: BoxFit.cover,),
          ),

          /// country name
          title: Text(vpnInfo.countryLongName),
          /// vpn speed
          subtitle: Row(
            children: [
              Icon(Icons.shutter_speed,
              color: Colors.redAccent,
                size: 20,
              ),
              SizedBox(width: 4,),
              
              Text(formatSpeedBytes(vpnInfo.speed, 2),
              style: TextStyle(
                fontSize: 16,
              ),
              ),
            ],



          ),
          /// number of session
          trailing:  Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                vpnInfo.vpnSessionNum.toString(),
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).lightTextColor
                ),
              ),
              SizedBox(width: 4,),

              Icon(CupertinoIcons.person_2_alt,color: Colors.redAccent,)
            ],

          ),
        ),
      ),
    );
  }
}
