import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_config/flutter_config.dart';
//class - different , method
//instance - different data

class worker{
  late String location;
  worker({required this.location}){
    location = this.location;
  }

  late String temp ;
  late String humidity;
  late String air_speed;
  late String description;
  late String main;
  late String icon;

//method

  Future<void> getData() async{
    try{
      String api_mine = await FlutterConfig.get('API_ID');
      // http.Response response = await http.get(Uri.parse(api_url));
      var url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$api_mine");
      http.Response response = await http.get(url);
      Map data =  jsonDecode(response.body);

      //Getting Temp Humidity
      Map temp_data = data['main'];
      String getHumidity = (temp_data['humidity']).toString();
      String getTemp = (temp_data['temp'] -273.15).toString();

      //Getting air speed
      Map wind = data['wind'];
      String getAir_speed = (wind["speed"]*3.6).toString();

      //Getting Description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDesc = weather_main_data["description"];
      String getIcon = weather_main_data["icon"].toString();
      //Assigning Values
      temp = getTemp;
      humidity = getHumidity;
      air_speed = getAir_speed;
      description = getDesc ;
      main = getMain_des ;
      icon = getIcon ;
    }
    catch(e){
      temp = "Can't Find Data";
      humidity = "Can't Find Data";
      air_speed = "Can't Find Data";
      description = "Can't Find Data" ;
      main = "Can't Find Data" ;
      icon = "02d";
    }

  }
}

