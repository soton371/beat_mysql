import 'package:beat_mysql/add.dart';
import 'package:beat_mysql/update.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
class ViewPage extends StatefulWidget {
  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {

  String name;

  Future getdata() async{
    var response = await http.get('http://192.168.0.103/add/view.php');
    return jsonDecode(response.body);
  }
  @override
  void initState() {
    this.getdata();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beat mySql"),
        actions: [
          GestureDetector(
            child: Icon(Icons.add),
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Addpage())),
          )
        ],
      ),
      body: FutureBuilder(
        future: getdata(),
        builder: (context, snapshot){
          return snapshot.hasData ? ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index){
                List list = snapshot.data;
                return ListTile(
                  leading: GestureDetector(
                    child: Icon(Icons.edit),
                    onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdatePage(index: index, list: list))),
                  ),
                  title: Text(list[index]['name']),
                  //subtitle: Text(list[index]['id']),
                  trailing: GestureDetector(
                    child: Icon(Icons.delete),
                    onTap: (){
                      setState(() {
                        http.post('http://192.168.0.103/add/delete.php', body: {
                          'id' : list[index]['id']
                        });
                      });
                    },
                  ),
                );
              }
          ) : Text("loading");
        },
      ),
    );
  }
}
