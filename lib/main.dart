
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:la_brise/Activity/home.dart';
import 'package:la_brise/Activity/loading.dart';
import 'package:la_brise/Activity/location.dart';
import 'package:flutter_config/flutter_config.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
 runApp(MaterialApp(
   debugShowCheckedModeBanner: false,
    routes: {
      "/" : (context) => Loading(),
      "/home" : (context) => Home(),
      "/loading" : (context) => Loading(),
    },
  ));
}

