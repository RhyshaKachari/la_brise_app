import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
String username = "" ;

//Async = Functions Start But Return some delayed
  //Future.delayed - Function start after some delayed
  void getData() async{
    String api_url = await FlutterConfig.get('API_URL');
    final response = await http.get(Uri.parse(api_url));
      Map data =  jsonDecode(response.body);
      Map temp_data = data['main'];
      double temp = temp_data['temp'];
      print(temp);

  }

  int counter = 1;
  @override
  void initState() {
    super.initState();
    getData();
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Activity"),
      ) ,
      body: Column(
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => setState(() {
              counter += 1 ;
            }),
          ),
          Text("$counter"),
        ],
      )
      ,
    );
  }
}
