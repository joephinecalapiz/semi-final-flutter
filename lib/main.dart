import 'package:flutter/material.dart';
import 'package:semifinal/pages/homepage.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
    home: const HomePage(),

  ));
}