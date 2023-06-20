import 'package:flutter/material.dart';
import 'package:la_brise/Worker/worker.dart';
import 'package:flutter_spinkit/src/circle.dart';
import 'package:google_fonts/google_fonts.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late String temp;
  late String hum ;
  late String air_speed ;
  late String des;
  late String main;

  void startApp()async{
    worker instance = worker(location: "Mumbai");
    await instance.getData();

    temp = instance.temp ;
    hum = instance.humidity ;
    air_speed = instance.air_speed ;
    des = instance.description;
    main = instance.main ;
   Future.delayed(Duration(seconds: 2), () {
     Navigator.pushReplacementNamed(context, '/home' , arguments: {
       "temp_value" : temp,
       "hum_value" : hum,
       "air_speed_value" : air_speed ,
       "des_value" : des ,
       "main_value" : main
     });
   });


  }
  @override
  void initState() {
    // TODO: implement initState
    startApp();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("images/newicon.webp",height: 240 ,width: 240, ),
          SizedBox(height: 30,),
          Text("Weather App", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500 ,color: Colors.white),),
         SizedBox(height: 15,),
          Text("Made by Rhysha",
          style:  GoogleFonts.lato(
            fontSize: 18,color: Colors.white
          ),),
        SizedBox(height: 30,),
        SpinKitCircle(
          color: Colors.white,
          size: 50.0),
        ],
      ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
