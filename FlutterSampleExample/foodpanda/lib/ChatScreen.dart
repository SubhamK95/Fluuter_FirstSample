import 'package:flutter/material.dart';

const _name="Pawan";


class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChatScreen_State();
  }
}

class ChatScreen_State extends State<ChatScreen> {
  final TextEditingController _texttowrite = new TextEditingController();

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return _chatTextBoxes();
  }

  void handleSubmit(String message) {
    _texttowrite.clear();
  }

  Widget _chatTextBoxes() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          new Flexible(
              child: TextField(
            decoration: InputDecoration.collapsed(hintText: "Send a message"),
            controller: _texttowrite,
            onSubmitted: handleSubmit,
          )),
          new Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => handleSubmit(_texttowrite.text),
                color: Colors.red),
          ),
        ],
      ),
    );
  }
}

class ChatMessagebox extends StatefulWidget {

  String _name="pawan";

  @override
  State<StatefulWidget> createState() {
    return ChatMessagebox_State();
  }
}

class ChatMessagebox_State extends State<ChatMessagebox>{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(right: 16),
            child: new CircleAvatar(
            child: Text(_name[0]),
              
            ),


          )
        ],

      ),

    );
  }


}

