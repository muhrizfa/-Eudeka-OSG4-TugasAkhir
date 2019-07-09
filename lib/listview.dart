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
                    child: Text('${cardinfo[index].desc}'),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                  selected: true,
                ),
              ),
            ],
          );
        },
      );
  }
}
