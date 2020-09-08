import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Main());
}
class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Base(),);
  }
}
class Base extends StatefulWidget {
  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child:Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal[800],
            title: Text("WatsApp", style: TextStyle(fontSize: 20),),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.search),onPressed: (){},),
              PopupMenuButton(
                  icon: Icon(Icons.more_vert),
                  // ignore: non_constant_identifier_names
                  itemBuilder: (BuildContext Context) {
                    return [
                      PopupMenuItem(
                        child: FlatButton(child: Text("New group",style: TextStyle(fontSize: 15, color: Colors.black,),textAlign: TextAlign.end,),
                        ),
                      ),
                      PopupMenuItem(
                        child: FlatButton(onPressed: null,child: Text("New broadcast",style: TextStyle(fontSize: 15, color: Colors.black,),textAlign: TextAlign.end,),
                        ),
                      ),

                      PopupMenuItem(
                        child: FlatButton(onPressed: null,child: Text("Watsapp web",style: TextStyle(fontSize: 15, color: Colors.black,),textAlign: TextAlign.end,),
                        ),
                      ),
                      PopupMenuItem(
                        child: FlatButton(onPressed: null,child: Text("Starred message",style: TextStyle(fontSize: 15, color: Colors.black,),textAlign: TextAlign.end,),
                        ),
                      ),
                      PopupMenuItem(
                        // ignore: missing_return, non_constant_identifier_names
                        child: FlatButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)
                          {
                            return Settings();
                          },
                          )
                          );
                        },child: Text("Settings",style: TextStyle(fontSize: 15, color: Colors.black,),textAlign: TextAlign.end,),
                        ),
                      ),
                    ];
                  }
              )
              /*
          * "New broadcast"
          * "Watsapp web"
          * "Settings"
          * */
            ],
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.camera_alt),),
                Tab(text: "CHATS",),
                Tab(text: "STATUS",),
                Tab(text: "CALLS",)
              ],

            ),
          ),
          body: TabBarView(
            children: [
              Camera(),
              Chats(),
              Status(),
              Calls()
            ],
          ),

        ));
  }
}
class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace, color: Colors.black,),
            onPressed:(){
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.teal[800],
          title: Text("Settings"),
        ),
      ),
    );
  }
}

class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Status"),);
  }
}
class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}
class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: listTile.getRecentMessages(),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: Colors.green,
        child: Icon(Icons.chat),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context){
                return ContactList();
              }
          ));
        },
      ),
    );
  }
}

class Camera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Camera"),);
  }
}
class Calls extends StatefulWidget {
  @override
  _CallsState createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Calls"),);
  }
}
// ignore: camel_case_types
class listTile{
  String _contact;
  String _recentChat;
  String _lastChecked;
  listTile(String contact, String recentChat, String lastChecked){
    this._contact = contact;
    this._recentChat = recentChat;
    this._lastChecked =  lastChecked;
  }
  // ignore: non_constant_identifier_names
  Widget Displaytile(){
    return ListTile(leading: Icon(Icons.supervised_user_circle,size: 60,),title: Text(this._contact,style: TextStyle(fontSize: 18),),
      subtitle: Row(
        children: [
          Icon(Icons.check),
          Text(this._recentChat),
        ],
      ),
      trailing: Text(this._lastChecked,style: TextStyle(fontSize: 10,color: Colors.grey),),
    );
  }
  static List<Widget> getRecentMessages(){
    return <Widget>[
      /*
      * DataBase Part
      * everything goes to server
      * */
      listTile("Akshat","Hello, How Are you??","1:00").Displaytile(),
      listTile("Akshat Sahijpal","Hello, How Are you??","1:02").Displaytile(),
      listTile("Aman","Hello, How Are you??","3:00").Displaytile(),
      listTile("Poonam","Hello, How Are you??","4:00").Displaytile(),
      listTile("Doctor","Hello, How Are you??","12:00").Displaytile(),
      listTile("Ceo","Hello, How Are you??","11:00").Displaytile(),
      listTile("Akshat","Hello, How Are you??","1:00").Displaytile(),

    ];
  }
}
class ContactList extends StatelessWidget{
  String _name;
  ContactList();
  String getName(){
    return _name;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace, color: Colors.black,),
          onPressed:(){
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(onPressed: null,icon: Icon(Icons.search),),
          ////////////////////////////////////////////////////////////////
          PopupMenuButton(
              icon: Icon(Icons.more_vert),
              // ignore: non_constant_identifier_names
              itemBuilder: (BuildContext Context) {
                return [
                  PopupMenuItem(
                    child: FlatButton(child: Text("Invite a friend",style: TextStyle(fontSize: 15, color: Colors.black,),textAlign: TextAlign.end,),
                    ),
                  ),
                  PopupMenuItem(
                    child: FlatButton(onPressed: null,child: Text("Contacts",style: TextStyle(fontSize: 15, color: Colors.black,),textAlign: TextAlign.end,),
                    ),
                  ),

                  PopupMenuItem(
                    child: FlatButton(onPressed: null,child: Text("Refresh",style: TextStyle(fontSize: 15, color: Colors.black,),textAlign: TextAlign.end,),
                    ),
                  ),
                  PopupMenuItem(
                    child: FlatButton(onPressed: null,child: Text("Help",style: TextStyle(fontSize: 15, color: Colors.black,),textAlign: TextAlign.end,),
                    ),
                  ),
                ];
              }
          )
          ///////////////////////////////////////////////////////////////
        ],
        backgroundColor: Colors.teal[800],
        title: Text("Selected Contact"),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(child: IconButton(icon: Icon(Icons.people,color: Colors.white),onPressed: (){},color: Colors.green),backgroundColor: Colors.green,),
            title: Text("New group",style: TextStyle(fontSize: 18, color: Colors.black),),
          ),
          ListTile(
            leading: CircleAvatar(child: IconButton(icon: Icon(Icons.add_to_photos,color: Colors.white,),onPressed: (){},color: Colors.green,),backgroundColor: Colors.green),
            title: Text("New contact",style: TextStyle(fontSize: 18, color: Colors.black),),
            trailing: Icon(Icons.apps),
          ),
        ],
      ),
    );
  }
}