import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.center ,
            children: [
              Container(color: Colors.amber,height: 200, width: 200),
              Container(color: Colors.blue,height: 150, width: 150),
            ],
          ),
          Stack(
            alignment: AlignmentDirectional.center ,
            children: [
              Container(color: Colors.blue,height: 200, width: 200),
              Container(color: Colors.amber,height: 150, width: 150),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(color: Colors.pinkAccent,height: 100, width: 100),
              Container(color: Colors.cyanAccent,height: 100, width: 100),
              Container(color: Colors.amberAccent,height: 100, width: 100),
            ],
          )
        ],
      ),
    );
  }
}
