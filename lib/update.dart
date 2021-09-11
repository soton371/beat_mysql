import 'package:beat_mysql/view.php.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class UpdatePage extends StatefulWidget {

  var index, list;

  UpdatePage({this.index, this.list});

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  
  var name = TextEditingController();
  
  updateData(){
    http.post('http://192.168.0.103/add/update.php', body: {
      'id' : widget.list[widget.index]['id'],
      'name' : name.text
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(widget.index != null){
      name.text = widget.list[widget.index]['name'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Data"),
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
              updateData();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewPage()));
            },
            child: Text("Update"),
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
