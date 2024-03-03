import 'package:flutter/material.dart';
import 'package:sales_portal_app_2/home%20page/home_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Sales Portal',
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light().copyWith(
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontFamily: 'Roboto' ,fontSize: 40, fontWeight: FontWeight.bold),
        labelMedium: TextStyle(fontFamily: 'Roboto' ,fontWeight: FontWeight.bold,fontSize: 14, color: Colors.black),
      )
    ),
    home: const HomePage(),
  );
  }
}
