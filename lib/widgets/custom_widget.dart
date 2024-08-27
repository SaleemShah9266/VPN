import 'package:flutter/material.dart';
import 'package:vpn/main.dart';

class CustomWidget extends StatelessWidget {

  final String titleText;
  final String subTitleTexts;
  final Widget roundWidgetWithIcon;
  const CustomWidget({
    super.key,
    required this.titleText,
    required this.subTitleTexts,
    required this.roundWidgetWithIcon
  });

  @override
  Widget build(BuildContext context) {
    sizeScreen = MediaQuery.of(context).size;
    return SizedBox(
      width: sizeScreen.width * .46,
      child: Column(
        children: [
          roundWidgetWithIcon,
          SizedBox(height: 7,),

          Text(titleText,style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          ),
          SizedBox(height: 7,),
          Text(subTitleTexts,style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          ),


        ],
      ),

    );
  }
}
