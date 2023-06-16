import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
String username = "" ;

//Async = Functions Start But Return some delayed
  //Future.delayed - Function start after some delayed
  void getData()  {
    //process
    Future.delayed(Duration(seconds: 2),(){
      username = "Dhruv";
    });
    // print("$username");
  }

void showData() async {
    await getData();
    print("$username");
}
  int counter = 1;
  @override
  void initState() {
    super.initState();
    getData();
    showData();
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
