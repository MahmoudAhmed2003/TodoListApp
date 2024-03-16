import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_proj/view/HomeScreen.dart';
import 'controller/HomeControler.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeController(),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
      home: HomeScreen(),


        theme: ThemeData.dark(),

      ),


    );
  }


}