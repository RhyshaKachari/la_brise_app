
import 'package:flutter/material.dart';
import 'package:la_brise/Activity/home.dart';
import 'package:la_brise/Activity/loading.dart';
import 'package:la_brise/Activity/location.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      "/" : (context) => Loading(),
      "/home" : (context) => Home(),
    },
  ));
}

