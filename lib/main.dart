import 'package:flutter/material.dart';
import 'dart:async';
import 'package:serpismotor/utils/colors.dart';
import 'package:serpismotor/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash',
      theme: ThemeData(
        scaffoldBackgroundColor: primaryColor,
        primaryColor: primaryColor,
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: textColor
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),
        ()=>Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => HomeView())
        )
    );
  }
  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.white,
      child: FlutterLogo(
        size: MediaQuery.of(context).size.height,
      ),
    );
  }

}



