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
  // late String temp;
  // late String hum ;
  // late String air_speed ;
  // late String des;
  // late String main;
  // late String icon ;

  var city_name = "Mumbai";
  void startApp(String city)async{
    worker instance = worker(location: city_name);
    await instance.getData();


   Future.delayed(Duration(seconds: 2), () {
     Navigator.pushReplacementNamed(context, '/home' , arguments: {
       "temp_value" : instance.temp ,
       "hum_value" : instance.humidity ,
       "air_speed_value" : instance.air_speed ,
       "des_value" : instance.description ,
       "main_value" : instance.main,
       "icon_value" : instance.icon,
       "city_value" : city_name,
     });
   });


  }
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final search = ModalRoute.of(context)!.settings.arguments as Map?;
    // city_name = search?['searchText'];
    if(search?.isNotEmpty ?? false){
      city_name = search?['searchText'];
    }
    startApp(city_name);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
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
      ),
      backgroundColor: Colors.black,
    );
  }
}
