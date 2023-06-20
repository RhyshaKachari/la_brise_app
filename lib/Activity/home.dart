import 'dart:convert';
import 'dart:math';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';
import 'package:la_brise/Worker/worker.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
String username = "" ;

//Async = Functions Start But Return some delayed
  //Future.delayed - Function start after some delayed

  int counter = 1;
  @override
  void initState() {
    super.initState();
    print("This is an init state");
  }
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("Set state Called");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Widget destroyed");
  }
  @override
  Widget build(BuildContext context) {

    // final info = ModalRoute.of(context)!.settings.arguments;
    var city_name = ["Mumbai" , "Delhi" , "Chennai" , "Dhar", "Indore","Guwahati"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // stops: [
              //   0.8,
              //   0.9,
              // ],
              colors: [
                Colors.black,
                Colors.pink
              ]
            ),
          ),
          child: Column(
            children: [
              Container( // Search wala container
                // color: Colors.grey,
                padding: EdgeInsets.symmetric(horizontal: 8),
                margin: EdgeInsets.symmetric(horizontal: 24,vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24)
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        print("Search Me");
                      },
                      child: Container(child: Icon(Icons.search , color: Colors.pink,) , margin: EdgeInsets.fromLTRB(3, 0, 7, 0),),
                    ),
                    Expanded(child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search $city",
                      ),
                    )),

                  ],
                ),
              )

            ],
          ),
        ),
      ) ,
    );
  }
}
