import 'dart:convert';
import 'dart:math';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';
import 'package:la_brise/Worker/worker.dart';
import 'package:weather_icons/weather_icons.dart';
// import 'package:gradient_app_bar/gradient_app_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String username = "";

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
    var city_name = [
      "Mumbai",
      "Delhi",
      "Chennai",
      "Dhar",
      "Indore",
      "Guwahati"
    ];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.black,
        ),
      ),
      
      // backgroundColor: Colors.black,
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(0),
      //   child: GradientAppBar(
      //     gradient: LinearGradient(
      //       colors:[
      //         Colors.blue,
      //         Colors.pinkAccent
      //       ] ,
      //       begin: Alignment.topRight,
      //       end: Alignment.bottomLeft
      //     ) ,
      //   ),
      // ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter, end: Alignment.bottomCenter,
                // stops: [
                //   0.8,
                //   0.9,
                // ],
                colors: [Colors.black, Colors.pink]),
          ),
          child: Column(
            children: [
              Container(
                // Search wala container
                // color: Colors.grey,
                padding: EdgeInsets.symmetric(horizontal: 8),
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("Search Me");
                      },
                      child: Container(
                        child: Icon(
                          Icons.search,
                          color: Colors.pink,
                        ),
                        margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                      ),
                    ),
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search $city",
                      ),
                    )),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5)),
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      padding: EdgeInsets.all(26),
                      child: Row(
                        children: [
                          // Image.network(""),
                          Column(
                            children: [
                              Text("Scattered Clouds", style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),),
                              Text("In Ahmedabad",style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
               Row(
                 children: [
                   Expanded(
                    child: Container(
                      height: 225,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5)),
                      margin: EdgeInsets.symmetric(horizontal: 25 , vertical: 10),
                      padding: EdgeInsets.all(26),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Icon(Icons.device_thermostat),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("41" , style: TextStyle(fontSize: 70),),
                              Text("C" , style: TextStyle(fontSize: 30),)
                            ],
                          )
                        ],
                      ),
                    ),
              ),
                 ],
               ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
               Expanded(
                child: Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
          color: Colors.white.withOpacity(0.5)),
        margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
      padding: EdgeInsets.all(26),
                  height: 200,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.waves),
            ],
          ),
          SizedBox(height: 20,),
          Text("20.9", style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold
          ),),
          Text("km/hr")
        ],
      ),
    ),
              ),
                   Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5)),
                      margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                      padding: EdgeInsets.all(26),
                      height: 200,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.water_drop),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Text("60", style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold
                          ),),
                          Text("Percent")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Made by Rhysha"),
                    Text("Data Provided By Openweathermap.org")
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
