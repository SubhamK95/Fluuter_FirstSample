import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodpanda/pojo/LoginPojo.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {


  TextEditingController _conusername = new TextEditingController();
  TextEditingController _conemail = new TextEditingController();
  TextEditingController _conpassword = new TextEditingController();
  final Future<LoginPojo> login;
  LoginScreen({Key key, this.login}) : super(key: key);

  Future _performLogin() async {
    //_progressHUD.state.show();
    String username = _conusername.text;
    String email = _conemail.text;
    String password = _conpassword.text;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    bool _autoValidate = false;

    LoginPojo loginPojo = new LoginPojo(
        username: username, email: email, password: password);
    LoginPojo p = await createPost(
        "http://stormsurfcanada.com/mobileapi/signup.php?",
        login: loginPojo.toMap()) as LoginPojo;
  }

  Future<LoginPojo> createPost(String url, {Map login}) {
    return http.post(url, body: login).then((http.Response response) {
      final int statusCode = response.statusCode;
     // _progressHUD.state.dismiss();
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return LoginPojo.fromJson(json.decode(response.body));
    });
  }


  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('images/logo.png', color: Colors.red,),
      ),
    );


    final username = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      controller: _conusername,
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: _conemail,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: _conpassword,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          if(_conusername.text.isEmpty||_conemail.text.isEmpty){
            final snackBar = new SnackBar(content: new Text("Filed can not be empty"), backgroundColor: Colors.red);
            Scaffold.of(context).showSnackBar(snackBar);
          }else{
            _performLogin();
          }
        },
        padding: EdgeInsets.all(16),
        color: Colors.red,
        child: Text('Sign Up', style: TextStyle(color: Colors.white)),
      ),
    );


    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            username,
            SizedBox(height: 24.0),
            email,
            SizedBox(height: 24.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
          ],
        ),
      ),
    );
  }
}
