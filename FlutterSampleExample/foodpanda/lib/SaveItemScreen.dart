import 'package:flutter/material.dart';

class SaveItemScreen extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    return SaveItemScreen_State();
  }

}


class SaveItemScreen_State extends State<SaveItemScreen>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home:Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                BackButton(),
                Container(
                  margin: const EdgeInsets.fromLTRB(16.0,12,0,0),
                  child: Text("Card",style: TextStyle(fontSize: 16,color: Colors.black),)
                ),

              ],),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(left: 12),
                      child: Image.network(
                        "https://4.imimg.com/data4/XY/IT/ANDROID-23324165/product-500x500.jpeg",
                        height: 72,
                        width: 72,
                        fit: BoxFit.cover,
                      )),

                  Container(
                    margin: EdgeInsets.only(left: 12),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Uniyala's Barwachi",
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),

                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4),
                            child:Text(
                              "Sector 40 C , Chandigarh",
                              style: TextStyle(color: Colors.grey,fontSize: 12),

                            )
                        ),



                      ],

                    ),
                  ),






                ],




              ),

            ),
            Container(
              margin: EdgeInsets.all(8),
              child: Divider(
                color: Colors.grey,
                height: 1,
              ),



            ),



            ]


        ),



      )
    );
  }


}


class BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = new AssetImage("images/backbutton.png");
    Image image = new Image(
      image: assetImage,
      color: Colors.red,
      height: 20,
      width: 20 ,
    );
    return Container(
      child: image,
      margin: EdgeInsets.fromLTRB(12, 12, 0, 0),
    );
  }
}


