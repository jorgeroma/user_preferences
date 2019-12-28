import 'package:flutter/material.dart';

import 'package:user_preferences/src/pages/home_page.dart';
import 'package:user_preferences/src/pages/settings_page.dart';

class MenuWidget extends StatelessWidget {
  final String ruta;
  MenuWidget(this.ruta);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/menu-img.jpg'),
                fit: BoxFit.cover
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.pages),
            title: Text('Home'),
            onTap: ()=>(ruta!='home')?Navigator.pushReplacementNamed(context, HomePage.routeName):Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(Icons.party_mode),
            title: Text('Party Mode'),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('People'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: (){
              // Navigator.pop(context);
              // Navigator.pushNamed(context, SettingsPage.routeName);
              (ruta!='settings')?Navigator.pushReplacementNamed(context, SettingsPage.routeName):Navigator.pop(context);
              
            },
          ),
        ],
      ),
    );    
  }
}