import 'package:flutter/material.dart';
import 'package:foodpanda/model/AddToCardModel.dart';

class AddtoCardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new AddToCard_State();
  }
}

// ignore: camel_case_types
class AddToCard_State extends State<AddtoCardScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
              child: Column(
        children: <Widget>[
          BackButton(),
          Container(
            margin: EdgeInsets.all(12),
            child: Text(
              "Pizza Hut(Sector 40 C)",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Text(
            "3 items , Rs. 3000",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),

          Text("dsfsdfdsf")

          /*  ListView.builder(
            padding: const EdgeInsets.all(12.0),
              itemCount: addCardList.length,
              itemBuilder: (context, i) => new Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 12),
                      child: Image.network(
                        addCardList[i].item_numer_logo,
                        height: 16,
                        width: 16,
                      ),
                    )
                  ],
                ),
          )*/

          /* ListView.builder(
            padding: const EdgeInsets.all(12.0),
            itemCount: addCardList.length,
            itemBuilder: (context, i) => new Row(
                  children: <Widget>[
                    // first item Image
                    Container(
                      margin: EdgeInsets.only(left: 12),
                      height: 12,
                      width: 12,
                      child: Image.network(
                        addCardList[i].item_numer_logo,
                        height: 16,
                        width: 16,
                      ),
                    ),

                    Container(
                        margin: EdgeInsets.only(left: 12),
                        // Second Items
                        child: Column(
                          children: <Widget>[
                            Container(
                                child: Text(
                              addCardList[i].item_name,
                              style: TextStyle(
                                  fontSize: 14, fontStyle: FontStyle.normal,color: Colors.black),
                            )),
                            Container(
                                child: Text(
                              addCardList[i].item_price,
                              style: TextStyle(
                                  fontSize: 14, fontStyle: FontStyle.normal),
                            )),
                            Container(
                                child: Text(
                              addCardList[i].item_ingradients,
                              style: TextStyle(
                                  fontSize: 14, fontStyle: FontStyle.normal),
                            )),
                          ],
                        )),

                    Text("Add Number Picker here"),
                    Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
          ),*/
        ],
      ))),
    );
  }
}

Widget _getCardsItems() {
  return new ListView.builder(
    padding: const EdgeInsets.all(10.0),
    itemBuilder: (context, i) {
      Container(
        child: Text("sdgfdfgfghfgh"),
      );

    },
  );
}

class BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    alignment:
    MainAxisAlignment.start;
    AssetImage assetImage = new AssetImage("assets/backbutton.png");
    Image image = new Image(
      image: assetImage,
      color: Colors.red,
      height: 24,
      width: 24,
    );
    return Container(
      child: image,
      margin: EdgeInsets.fromLTRB(0, 36, 0, 0),
    );
  }
}
