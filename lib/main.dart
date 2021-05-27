import 'package:android_sunflower/constants/colors.dart';
import 'package:android_sunflower/pages/gallery_page.dart';
import 'package:android_sunflower/pages/home.dart';
import 'package:android_sunflower/pages/home_two.dart';
import 'package:android_sunflower/pages/plant_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: sunflower_green_500
    // ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: sunflower_green_500,
          scaffoldBackgroundColor: sunflower_green_500,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
          // visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: HomePageTwo(),
    );
  }
}


