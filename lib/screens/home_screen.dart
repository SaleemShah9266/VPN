import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vpn/Models/vpn_status.dart';
import 'package:vpn/appPreferences/preferences.dart';
import 'package:vpn/controller/controller_home.dart';
import 'package:vpn/main.dart';
import 'package:vpn/screens/available_vpn_servers_location_screen.dart';
import 'package:vpn/vpn_engine/vpn_engine.dart';
import 'package:vpn/widgets/custom_widget.dart';

class HomeScreen extends StatelessWidget {
 HomeScreen({super.key});

  final homeController = Get.put(ControllerHome());
  locationSelectionBottomNavigation(BuildContext context){
    return SafeArea(
      child: Semantics(
        button: true,
        child: InkWell(
          onTap: (){
            Get.to(() => AvailableVpnServersLocation());
          },
          child: Container(
            color: Colors.redAccent,
            padding: EdgeInsets.symmetric(horizontal:sizeScreen.width *.041 ),
            height: 62,
            child: Row(
              children: [
                Icon(CupertinoIcons.flag_circle,color: Colors.white,
                size: 36,
                ),
                SizedBox(width: 12,),
                Text("Select Country / Location",style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                ),
                Spacer(),

                CircleAvatar(
                  backgroundColor: Colors.white70,
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.redAccent,
                    size: 26,
                  ),
                )

              ],
            ),
          ),

        ),

      ),
    );
  }

Widget vpnRoundedButton(){
    return Column(
      children: [
        Semantics(
          button: true,
          child: InkWell(
            onTap: (){
              
            },
            borderRadius: BorderRadius.circular(100),
            child: Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: homeController.getRoundButtonColor.withOpacity(.1),

              ),
              child: Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: homeController.getRoundButtonColor.withOpacity(.3),

                ),
               child: Container(
                 height: sizeScreen.height * .14 ,
                 width: sizeScreen.width * .14 ,
                 decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   color:homeController.getRoundButtonColor,

                 ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Icon(Icons.power_settings_new,size: 30,color: Colors.white,),
                     
                     SizedBox(height: 6,),
                     Text(
                       homeController.getRoundedButtonText ,
                       style: TextStyle(
                         fontSize: 12, color: Colors.white, fontWeight: FontWeight.w600),)
                   ],
                 ),

               ),

              ),
            ),

          ),
        )
      ],
    );

}

  @override
  Widget build(BuildContext context) {
    VpnEngine.snapshotVpnStage().listen((event) {
      homeController.vpnConnectionState.value = event;
    });
    sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Free VPN'),
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.perm_device_info),

        ),
        actions: [
          IconButton(
              onPressed: (){
                Get.changeThemeMode(
                  AppPreferences.isModeDark ? ThemeMode.light: ThemeMode.dark
                );
                AppPreferences.isModeDark = !AppPreferences.isModeDark;

              },
              icon: Icon(Icons.brightness_2_rounded))
        ],

      ),

      bottomNavigationBar: locationSelectionBottomNavigation(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          /// 2 rounded widgets
          /// location + ping
       Obx(() =>  Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           CustomWidget(titleText: homeController.vpnInfo.value.countryLongName.isEmpty ? "Location" : homeController.vpnInfo.value.countryLongName,
             subTitleTexts: "FREE",
             roundWidgetWithIcon: CircleAvatar(
               radius: 32,
               backgroundColor: Colors.redAccent,
               child: homeController.vpnInfo.value.countryLongName.isEmpty ? Icon(Icons.flag_circle,
                 size: 30,
                 color: Colors.white70,) : null,
               backgroundImage:  homeController.vpnInfo.value.countryLongName.isEmpty ? null :AssetImage("countryFlags/${homeController.vpnInfo.value.countryShortName.toLowerCase()}.png"),

             ),
           ),

           CustomWidget(titleText:  homeController.vpnInfo.value.countryLongName.isEmpty ?  "60 ms" :homeController.vpnInfo.value.ping + "ms" ,
             subTitleTexts: "PING",
             roundWidgetWithIcon: CircleAvatar(
               radius: 32,
               backgroundColor: Colors.orangeAccent,
               child: Icon(Icons.graphic_eq,
                 size: 30,
                 color: Colors.white70,),
             ),
           ),
         ],
       ),
       ),

          ///VPN Button
          vpnRoundedButton(),


          /// 2 rounded widgets
          /// download + ping
StreamBuilder<VpnStatus?>(
  initialData: VpnStatus(),
  stream: VpnEngine.snapshotVpnStatus(),
  builder: (context, dataSnapshot){
    return           Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomWidget(titleText: "${dataSnapshot.data?.byteIn ?? '0 kbp s '}",
          subTitleTexts: "DOWNLOADS",
          roundWidgetWithIcon: CircleAvatar(
            radius: 32,
            backgroundColor: Colors.greenAccent,
            child: Icon(Icons.arrow_circle_down,
              size: 30,
              color: Colors.white70,),
          ),
        ),

        CustomWidget(titleText: "${dataSnapshot.data?.byteOut ?? '0 kbps '}",
          subTitleTexts: "UPLOAD",
          roundWidgetWithIcon: CircleAvatar(
            radius: 32,
            backgroundColor: Colors.purpleAccent,
            child: Icon(Icons.arrow_circle_up,
              size: 30,
              color: Colors.white70,),
          ),
        ),
      ],
    );

  },
),
        ],
      ),
    );
  }
}
