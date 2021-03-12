import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Ankit'), 
              accountEmail: Text('aj.ankitsingh@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8YXZhdGFyfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
                ),
              )
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Account'),
              subtitle: Text("Personal"),
              trailing: Icon(Icons.edit)
            ),
             ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text("aj.ankitsingh@gmail.com"),
              trailing: Icon(Icons.send)
            )
          ]
        ),
      );
  }
}