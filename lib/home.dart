import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tugasakhir_eudeka/gridview.dart';
import 'package:tugasakhir_eudeka/listview.dart';
import 'package:tugasakhir_eudeka/main.dart';
import 'package:tugasakhir_eudeka/model.dart';
import 'package:http/http.dart' as http;
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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController tabController;

  @override
  Widget build(BuildContext context) {
    tabController = new TabController(length: 2, vsync: this);

    var tabBarItem = new TabBar(
      tabs: [
        new Tab(
          icon: new Icon(Icons.list),
        ),
        new Tab(
          icon: new Icon(Icons.grid_on),
        ),
      ],
      controller: tabController,
      indicatorColor: Colors.white,
    );

    var listItem = FutureBuilder<List<Cardinfo>>(
      future: fetchPosts(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? ListViewCard(cardinfo: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );

    var gridview = FutureBuilder<List<Cardinfo>>(
      future: fetchPosts(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? GridViewList(cardinfo: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );

    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text(appTitle),
          centerTitle: true,
          bottom: tabBarItem,
        ),
        body: new TabBarView(
          controller: tabController,
          children: [
            listItem,
            gridview,
          ],
        ),
      ),
    );
  }
}
