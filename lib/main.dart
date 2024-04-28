import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_aboutme/blog.dart';
import 'package:my_aboutme/homePage.dart';
import 'package:my_aboutme/login.dart';
import 'package:my_aboutme/product_form_create.dart';
import 'package:my_aboutme/product_list.dart';
import 'package:my_aboutme/profile.dart';
import 'package:my_aboutme/videoPresentation.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'My About Me'),
      routes: <String, WidgetBuilder>{
        'profile': (BuildContext context) => const ProFile(),
        'video_presentation': (BuildContext context) =>
            const VideoPresentation(),
        'blog': (BuildContext context) => const Blog(),
        'product': (BuildContext context) => const ProductList(),
        'productCreate': (BuildContext context) => const ProductFormCreate(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int userId = 0;
  @override
  void initState(){
    super.initState();
    checkLogin();
  }

  Future<void> checkLogin() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int userid = prefs.getInt('userauthen')!;
    setState(() {
      userId = userid;
    }); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<bool>(
      builder: (context, snapshot) {
        if (userId >= 1){
        return const HomePage();
      }else{
        return const Login();
      }
      },
      future: null,
    ));
  }
}
