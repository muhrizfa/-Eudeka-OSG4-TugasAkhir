import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tugasakhir_eudeka/home.dart';
import 'dart:convert';


final appTitle = 'Yu-Gi-Oh! Card Deck';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(title: appTitle),
      debugShowCheckedModeBanner: false,
    );
  }
}