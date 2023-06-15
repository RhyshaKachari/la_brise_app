import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void timer(){
    //process -  5 second
    Future.delayed(Duration(seconds: 3) , (){
      print("ALARM IS RINGING");
    });
    print("You can do other stuff too");
  }

  int counter = 1;
  @override
  void initState() {
    super.initState();
    timer();
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
