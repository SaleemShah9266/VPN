import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vpn/appPreferences/preferences.dart';
import 'package:vpn/main.dart';
import 'package:vpn/widgets/custom_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  locationSelectionBottomNavigation(BuildContext context){
    return SafeArea(
      child: Semantics(
        button: true,
        child: InkWell(
          onTap: (){},
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



  @override
  Widget build(BuildContext context) {
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomWidget(titleText: "Location",
              subTitleTexts: "FREE",
              roundWidgetWithIcon: CircleAvatar(
                radius: 32,
                backgroundColor: Colors.redAccent,
                child: Icon(Icons.flag_circle,
                  size: 30,
                  color: Colors.white70,),
              ),
            ),

            CustomWidget(titleText: "60 ms",
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


          /// 2 rounded widgets
          /// download + ping
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomWidget(titleText: "0 kbps",
                subTitleTexts: "DOWNLOADS",
                roundWidgetWithIcon: CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.greenAccent,
                  child: Icon(Icons.arrow_circle_down,
                    size: 30,
                    color: Colors.white70,),
                ),
              ),

              CustomWidget(titleText: "0 kbps",
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
          ),

        ],
      ),
    );
  }
}
