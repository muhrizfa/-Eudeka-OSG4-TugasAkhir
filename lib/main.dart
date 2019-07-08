import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yu-Gi-Oh!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Yu-Gi-Oh! Card Deck'),
      debugShowCheckedModeBanner: false,
    );
  }
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
        body:
            null // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:tugasakhir_eudeka/model.dart';
// import 'package:http/http.dart' as http;

// final String jsonplaceholder = "https://db.ygoprodeck.com/api/v5/cardinfo.php";

// //Future method to read the URL
// Future<Cardinfo> fetchInfo() async {
//   final response = await http.get(jsonplaceholder);
//   final jsonresponse = json.decode(response.body);

//   return Cardinfo.fromJson(jsonresponse[0]);
// }

// void main() {
//   runApp(new MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       home: new MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   final List<Cardinfo> cardinfo;
//   final List<CardImage> cardImages;

//   const MyHomePage({Key key, this.cardinfo, this.cardImages}) : super(key: key);

//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         appBar: new AppBar(
//           title: new Text("Parse JSON"),
//         ),
//         body: new Center(
//           child: new Column(
//             children: <Widget>[
//               new FutureBuilder(
//                   future: fetchInfo(),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       return new Column(
//                         children: <Widget>[
//                           new Card(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15.0),
//                             ),
//                             color: Colors.white,
//                             child: ListTile(
//                               leading: CircleAvatar(
//                                 backgroundImage: NetworkImage(
//                                     snapshot.data.cardImages[0].imageUrlSmall),
//                               ),
//                               title: new Container(
//                                 margin: EdgeInsets.only(top: 10.0),
//                                 child: Text(
//                                   snapshot.data.name,
//                                   style: TextStyle(
//                                     fontSize: 15.0,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                               subtitle: new Container(
//                                 margin:
//                                     EdgeInsets.only(top: 10.0, bottom: 10.0),
//                                 child: Text(snapshot.data.desc),
//                               ),
//                               trailing: Icon(Icons.keyboard_arrow_right),
//                               onTap: () {},
//                               selected: true,
//                             ),
//                           ),
//                         ],
//                       );
//                     } else if (snapshot.hasError) {
//                       return new Text("Error ${snapshot.error}");
//                     }
//                   })
//             ],
//           ),
//         ));
//   }
// }
