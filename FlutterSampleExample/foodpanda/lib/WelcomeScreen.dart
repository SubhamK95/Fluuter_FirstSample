import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodpanda/munuitems/MenuListingByCategory.dart';

final List<String> imgList = [
  'https://dingo.care2.com/pictures/greenliving/1014/1013023.large.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQveUrhbjn_nbsUDEPPQZJBx49BkcbiW2XqixnO3hg-BGI3BKdS',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaeHuDysjAeDtzVUKMKX4KjQFXY7F8TyibMI9xeT1_X8Ia5m9y4A',
  'http://www.traveller.com.au/content/dam/images/g/q/p/6/7/5/image.related.articleLeadwide.620x349.gqbjjm.png/1550469799141.jpg',
  'https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/articles/health_tools/surprising_cholesterol_foods/thinkstock_rf_photo_of_thai_food.jpg',
  'https://a57.foxnews.com/a57.foxnews.com/static.foxnews.com/foxnews.com/content/uploads/2018/09/640/320/1862/1048/2e4e9fc7-pasta_sauce.jpg?ve=1&tl=1?ve=1&tl=1'
];

final Widget placeholder = Container(color: Colors.grey);

final List child = map<Widget>(
  imgList,
  (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
          Image.network(i, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                'No. $index image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class WelcomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController searchController = new TextEditingController();
  String filter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:new IconTheme(
    data: new IconThemeData(
    color: Colors.red),
    child: new Column(
        children: <Widget>[
        Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search Food',
                    prefixIcon: Icon(Icons.search),
                    suffix: Icon(Icons.filter),
                    contentPadding: EdgeInsets.fromLTRB(6.0, 0, 24.0, 0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(39.0)),
                  )),
            )),
        ImageSlider(),
        new Expanded(
            child: GridView.count(
                primary: false,
                crossAxisCount: 3,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(choices.length, (index) {
                  return Center(
                    child: ChoiceCard(
                      choice: choices[index],
                    ),
                  );
                }))),
      ],
    )));
  }

  @override
  void initState() {
    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
    });
  }
}

class ImageSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Auto playing carousel
    final CarouselSlider autoPlayDemo = CarouselSlider(
      viewportFraction: 0.9,
      aspectRatio: 2.0,
      autoPlay: true,
      enlargeCenterPage: false,
      items: imgList.map(
        (url) {
          return Container(
            margin: EdgeInsets.all(4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(
                url,
                fit: BoxFit.cover,
                width: 1000.0,
              ),
            ),
          );
        },
      ).toList(),
    );

    return Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Column(children: [
          autoPlayDemo,
        ]));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Breakfast', icon: Icons.directions_car),
  const Choice(title: 'Lunch', icon: Icons.directions_bike),
  const Choice(title: 'Dinner', icon: Icons.directions_boat),
  const Choice(title: 'Snacks', icon: Icons.directions_bus),
  const Choice(title: 'Breakfast', icon: Icons.directions_car),
  const Choice(title: 'Lunch', icon: Icons.directions_bike),
  const Choice(title: 'Dinner', icon: Icons.directions_boat),
  const Choice(title: 'Snacks', icon: Icons.directions_bus),
  const Choice(title: 'Breakfast', icon: Icons.directions_car),
  const Choice(title: 'Lunch', icon: Icons.directions_bike),
  const Choice(title: 'Dinner', icon: Icons.directions_boat),
  const Choice(title: 'Snacks', icon: Icons.directions_bus),
];

void ClickonMenuItems() {}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    //final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Padding(
        padding: EdgeInsets.all(4),
        child: GestureDetector(
            onTap: () {
              Route route = MaterialPageRoute(
                  builder: (context) => MenuListingByCategory());
              Navigator.push(context, route);
              ;
            },
            child: Card(
              elevation: 12,
              color: Colors.white,
              margin: EdgeInsets.all(2),
              child: Center(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(choice.icon, size: 40.0, color: Colors.red),
                      Text(choice.title,
                          style: TextStyle(fontSize: 12, color: Colors.red)),
                    ]),
              ),
            )));
  }
}
