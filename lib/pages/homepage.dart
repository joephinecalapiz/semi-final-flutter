import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todolist = [];

  @override
  void initState() {
    super.initState();
    getTodoList();
  }


  Future<void> getTodoList() async{
    final res =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (res.statusCode == 200){
      final jsonPh = jsonDecode(res.body) as List;
      setState((){
        todolist = jsonPh;
      });
    }
    else{}

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List To Do")
      ),
      body: FutureBuilder(
        future: getTodoList(),
        builder:(context, snapshot){

          return ListView.builder(
            itemCount: todolist.length,
            itemBuilder: (context, index){
              final todos = todolist[index] as Map;

              return ListTile(
                    leading: CircleAvatar(child: Text(todolist[index]['id'].toString())),
                    title: Text (todos['title'],
                    style: const TextStyle(fontSize: 20, color: Colors.black)),
                    subtitle: Text(todos ['body'],
                    style: const TextStyle(fontSize: 18, color: Colors.black)),

              );

            }

          );

        }

      ),
    );
  }
}
