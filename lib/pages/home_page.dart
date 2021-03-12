import 'package:awesome_flutter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _nameController = TextEditingController();
  var myText = "Change Me";
  var url = "http://jsonplaceholder.typicode.com/photos";
  var data;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var res = await http.get(url);
    data = jsonDecode(res.body);
    setState(() {});
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: data != null 
          ? ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListTile(
                  leading: Image.network(data[index]["url"]),
                  title: Text(data[index]["title"]),
                  subtitle: Text("Data: ${data[index]["id"]}") 
                ),
              );
            }, 
            itemCount: data.length
          ) 
          : Center(
            child: CircularProgressIndicator() 
          )
        ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myText = _nameController.text;
          setState(() {
          });
        },
        child: Icon(Icons.refresh)
      ),
    );
  }
}

