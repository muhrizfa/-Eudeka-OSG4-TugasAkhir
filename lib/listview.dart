import 'package:flutter/material.dart';
import 'package:tugasakhir_eudeka/model.dart';

class ListViewCard extends StatelessWidget {
  final List<Cardinfo> cardinfo;
  final List<CardImage> cardImages;

  ListViewCard({Key key, this.cardinfo, this.cardImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cardinfo.length,
      padding: const EdgeInsets.all(15.0),
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            new Card(
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      '${cardinfo[index].cardImages[0].imageUrlSmall}'),
                ),
                title: new Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Text(
                    '${cardinfo[index].name}',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                subtitle: new Container(
                    margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                Text('${cardinfo[index].type}'),
                                Text('${cardinfo[index].race}'),
                                Text('${cardinfo[index].archetype}'),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  Text('${cardinfo[index].atk}'),
                                  Text('${cardinfo[index].def}'),
                                  Text('${cardinfo[index].attribute}'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                onTap: () {
                  showDialog(
                    barrierDismissible: true,
                    context: context,
                    child: new AlertDialog(
                      backgroundColor: Colors.transparent,
                      content: Image.network(
                        '${cardinfo[index].cardImages[0].imageUrl}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                selected: true,
              ),
            ),
          ],
        );
      },
    );
  }
}
