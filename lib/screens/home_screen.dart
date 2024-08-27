import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Free VPN'),
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.perm_device_info),

        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.brightness_2_rounded))
        ],

      ),
    );
  }
}
