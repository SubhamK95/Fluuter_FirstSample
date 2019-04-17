import 'package:flutter/material.dart';
class AddToCardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new AddToCard_State();
  }
}

// ignore: camel_case_types
class AddToCard_State extends State<AddToCardScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(28, 12, 0, 0),
         child:BackButton()
          ),
          Container(
            margin: EdgeInsets.fromLTRB(18, 16, 0, 0),
            child: Text(
              "Pizza Hut(Sector 40 C)",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),

          Container(
              margin: EdgeInsets.fromLTRB(24, 8, 0, 0),
              child:Text(
                "3 items ,  "+"\u20B9"+" 3000",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              )
          ),
          _getCardsItems(context)

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

Widget _getCardsItems(BuildContext context) {
 Scaffold(
   body:ListView.builder(
   itemCount: 34,


   )

 );
}

class BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = new AssetImage("images/backbutton.png");
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
