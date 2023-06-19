import 'package:api_practice/default_page.dart';
import 'package:api_practice/home_page.dart';
import 'package:api_practice/home_page2.dart';
import 'package:api_practice/ProductDetails.dart';
import 'package:api_practice/login_page.dart';
import 'package:api_practice/signup_page.dart';
import 'package:api_practice/upload_image.dart';
import 'package:api_practice/users_details.dart';
import 'package:api_practice/users_details2.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Api',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DefaultPage(),
    );
  }
}
