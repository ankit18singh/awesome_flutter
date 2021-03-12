import 'package:awesome_flutter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../drawer.dart';

class HomePage extends StatelessWidget {

  Future getData() async {
    var url = "http://jsonplaceholder.typicode.com/photos";
    var res = await http.get(url);
    return jsonDecode(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar( 
        title: Text("Awesome App"),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Constants.prefs.setBool("loggedIn", false);
              Navigator.pushReplacementNamed(context, "/login");
            }
          )
        ],
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.none: 
              return Center(child: Text("Fetch Something"));
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                  child: Text("Some error occurred")
                );
              } 
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: snapshot.data != null 
                  ? ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListTile(
                          leading: Image.network(snapshot.data[index]["url"]),
                          title: Text(snapshot.data[index]["title"]),
                          subtitle: Text("Data: ${snapshot.data[index]["id"]}") 
                        ),
                      );
                    }, 
                    itemCount: snapshot.data.length
                  ) 
                  : Center(
                    child: CircularProgressIndicator() 
                  )
                );
          }
        }
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // myText = _nameController.text;
          // setState(() {
          // });
        },
        child: Icon(Icons.refresh)
      ),
    );
  }
}

