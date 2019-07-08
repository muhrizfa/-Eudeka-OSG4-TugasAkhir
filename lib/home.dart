import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tugasakhir_eudeka/listview.dart';
import 'package:tugasakhir_eudeka/model.dart';
import 'package:http/http.dart' as http;
import 'package:tugasakhir_eudeka/model.dart';
import 'model.dart';
import 'dart:async';

Future<List<Cardinfo>> fetchPosts(http.Client client) async {
  final response =
      await client.get('https://db.ygoprodeck.com/api/v5/cardinfo.php');

  return compute(parsePosts, response.body);
}

List<Cardinfo> parsePosts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Cardinfo>((json) => Cardinfo.fromJson(json)).toList();
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Cardinfo>>(
        future: fetchPosts(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ListViewCard(cardinfo: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
