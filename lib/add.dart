import 'package:beat_mysql/view.php.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Addpage extends StatefulWidget {
  @override
  _AddpageState createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {

  var name = TextEditingController();

  addData(){
    http.post('http://192.168.0.103/add/add.php', body: {
      'name' : name.text
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data"),
      ),
      body: Column(
        children: [
          TextField(
            controller: name,
            decoration: InputDecoration(
              labelText: "Name"
            ),
          ),
          FlatButton(
              onPressed: (){
                addData();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewPage()));
              },
              child: Text("Add"),
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
