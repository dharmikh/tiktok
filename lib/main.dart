import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'Screen/Provider/VideoProvider.dart';
import 'Screen/videoview/view/videoview.dart';
import 'Screen/view/HomeScreen.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => VideoProvider(),

        ),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => VideoPlayerPage(),
              'vi':(context)=> VideoView(),
            },
          );
        },
      ),
    ),
  );
}
