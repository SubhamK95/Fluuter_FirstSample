import 'package:flutter/material.dart';
import 'package:foodpanda/model/MenuListingModel.dart';
import 'package:foodpanda/munuitems/AddtoCardScreen.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class MenuListingByCategory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MenuListingByCategory_State();
  }
}

// ignore: camel_case_types
class MenuListingByCategory_State extends State<MenuListingByCategory> {
  double rating = 4;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Pizzas", textAlign: TextAlign.start)),
        body: Container(
            child: ListView.builder(
          itemCount: dummyData.length,
          itemBuilder: (context, i) =>
          new GestureDetector(
            child: Row(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(left: 12),
                    child: Image.network(
                      dummyData[i].recipe_img,
                      height: 152,
                      width: 202,
                      fit: BoxFit.cover,
                    )),
                Column(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(left: 12),
                        child: Text(
                          dummyData[i].recipe_name,
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Container(
                        margin: EdgeInsets.only(
                            left: 12, right: 0, top: 8, bottom: 4),
                        child: Text(
                          dummyData[i].shot_description,
                        )),
                    Container(
                        margin: EdgeInsets.only(
                            left: 12, right: 0, top: 8, bottom: 4),
                        child: SmoothStarRating(
                          allowHalfRating: false,
                          onRatingChanged: (v) {
                            rating = v;
                          },
                          starCount: 5,
                          rating: rating,
                          size: 20.0,
                          color: Colors.red,
                          borderColor: Colors.red,
                        )),
                    Container(
                      margin: EdgeInsets.only(
                          left: 12, right: 0, top: 4, bottom: 4),
                      child: Text("32 Reviews"),
                    )
                  ],
                ),

                Padding(
                  padding:EdgeInsets.only(top: 24) ,
                    child:Divider(
                      color: Colors.green
                )

                )



              ],
            ),
              onTap: () {
              Route route = MaterialPageRoute(builder: (context) => AddToCardScreen());
              Navigator.push(context, route); ;

              }
          ),





        )),
      ),
    );
  }
}

/*
new Divider(
color: Colors.red,
height: 90.0,
),*/
