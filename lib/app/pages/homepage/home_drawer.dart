import 'package:flutter/material.dart';
import 'package:setup_wizard/app/components/constants.dart';
import 'package:setup_wizard/app/services/auth/auth.dart';

class DrawerHome extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const DrawerHome({Key key, this.scaffoldKey}) : super(key: key);

  @override
  _DrawerHomeState createState() => _DrawerHomeState();
}

class _DrawerHomeState extends State<DrawerHome> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Constants.blueGrey200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            FlatButton(
              splashColor: Colors.transparent,
              padding: EdgeInsets.all(15),
              onPressed: () => null,
              child: CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 35,
                ),
                radius: 35,
              ),
            ),
            FlatButton(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              onPressed: () => null,
              child: ListTile(
                title: Text("My Saved Games"),
                leading: Icon(Icons.videogame_asset),
              ),
            ),
            FlatButton(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              onPressed: () => null,
              child: ListTile(
                title: Text("Favorite Setups"),
                leading: Icon(Icons.star),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            FlatButton(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              onPressed: () {
                Auth.instance.signOut();
              },
              child: ListTile(
                title: Text("LogOut"),
                leading: Icon(Icons.logout),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
