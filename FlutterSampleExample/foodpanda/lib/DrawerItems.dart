import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda/ChatScreen.dart';
import 'package:foodpanda/ContactScreen.dart';
import 'package:foodpanda/PlaceOrder.dart';
import 'package:foodpanda/SaveItemScreen.dart';
import 'package:foodpanda/WelcomeScreen.dart';
import 'package:foodpanda/WishList.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomeScreen extends StatefulWidget {

  static String tag = 'home-page';


  final drawerItems = [
    new DrawerItem("Home", Icons.home),
    new DrawerItem("My Order", Icons.bookmark_border),
    new DrawerItem("Saved", Icons.save),
    new DrawerItem("Chat", Icons.chat),
    new DrawerItem("Contact Us", Icons.contacts),
    new DrawerItem("Wallet", Icons.favorite)
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomeScreen> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {

      case 0:
        return new WelcomeScreen();
        break;

      case 1:
        return new PlaceOrder();
        break;

      case 2:
        return new SaveItemScreen();
        break;

      case 3:
        return new ChatScreen();
        break;
      case 4:
        return new ContactScreen();
        break;

      case 5:
        return new WishList();
        break;

      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
          new ListTile(
            leading: new Icon(d.icon),
            title: new Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
        backgroundColor: Colors.red,
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,

      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            SetDrawerHeader(),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}

class SetDrawerHeader extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return UserAccountsDrawerHeader(
      accountName: Text("Subham Kotiyal",
        style: TextStyle(color: Colors.white),
      ),
      accountEmail: Text("subham.kotiyal1995@gmail.com",style: TextStyle(color: Colors.white),),
      currentAccountPicture:  CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 30.0,
        backgroundImage:
        NetworkImage('http://logoonline.mtvnimages.com/uri/mgid:ao:image:logotv.com:265454?quality=0.8&format=jpg'),
      ),
      otherAccountsPictures: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 30.0,
          backgroundImage:
          NetworkImage('http://logoonline.mtvnimages.com/uri/mgid:ao:image:logotv.com:265454?quality=0.8&format=jpg'),
        )
      ],

    );
  }



}

