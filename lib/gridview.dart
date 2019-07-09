import 'package:flutter/material.dart';
import 'package:tugasakhir_eudeka/model.dart';

class GridViewList extends StatelessWidget {
  final List<Cardinfo> cardinfo;
  final List<CardImage> cardImages;

  GridViewList({Key key, this.cardinfo, this.cardImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: cardinfo.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height),
        ),
        itemBuilder: (context, index) {
          return new GestureDetector(
            child: new Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.network(
                '${cardinfo[index].cardImages[0].imageUrl}',
                fit: BoxFit.cover,
              ),
              elevation: 3.0,
            ),
            onTap: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                child: new AlertDialog(
                  title: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              '${cardinfo[index].cardImages[0].imageUrlSmall}'),
                        ),
                      ),
                      new Text("${cardinfo[index].name}"),
                      new Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Column(children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Type ',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      Text(
                                        'Race ',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      Text(
                                        'Archtype ',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '${cardinfo[index].type}',
                                      style: TextStyle(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Text(
                                      '${cardinfo[index].race}',
                                      style: TextStyle(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Text(
                                      '${cardinfo[index].archetype}',
                                      style: TextStyle(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Attack ',
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        Text(
                                          'Deff ',
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        Text(
                                          'Attribute ',
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '${cardinfo[index].atk}',
                                        style: TextStyle(
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      Text(
                                        '${cardinfo[index].def}',
                                        style: TextStyle(
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      Text(
                                        '${cardinfo[index].attribute}',
                                        style: TextStyle(
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ])),
                    ],
                  ),
                  content: new Text("${cardinfo[index].desc}"),
                  actions: <Widget>[
                    new FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: new Text("OK"))
                  ],
                ),
              );
            },
          );
        });
  }
}
