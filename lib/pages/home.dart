import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';
import 'package:one/pages/Storage.dart';


class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  List<String> check_list = [];
  List<String> check_list_desc = [];
  List<String> check_list_title = [
    'Дверь','Окно','three'
  ];
  late String check_list_type = '';
  var description = '';
  int percents = 50;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: check_list.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(check_list[index])
                  ],
                ),
                Column(
                  children: [
                    Text(check_list_desc[index])
                  ],
                ),
                Column(
                  children: [
                    Text('completed $percents %')
                  ],
                ),
                Column(
                  children: [
                    IconButton(onPressed: () {
                        for(var j in check_list_title){
                          if(check_list[index] == j )
                            print(j);
                        };
                        print(check_list_desc[index]);
                        // Функция для перехода на страницу определённого чеклиста
                    } , icon: Icon(Icons.edit))
                    ]
                ),
                Column(
                  children: [
                    IconButton(onPressed: () {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text('Are u sure?'),
                            content: Text('After u will press ok button, check list will be deleted'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, 'Cancel');
                                  },
                                  child: Text('Cancel')
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context,'Ok');
                                    setState(() {
                                      check_list.removeAt(index);
                                      check_list_desc.removeAt(index);
                                    });
                                  },
                                  child: Text('Ok'))
                            ],
                          )
                      );
                    }
                    , icon: Icon(Icons.delete))
                  ],
                )
              ],
            ),
          );
        },
      ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
             onPressed: () {
          showDialog(context: context, builder: (BuildContext){
            return SimpleDialog(
              title: Text('Select Check List'),
              children: <Widget>[
                SimpleDialogOption(
                  padding: EdgeInsets.symmetric(horizontal: 24,vertical: 10),
                  onPressed: () async{
                    Navigator.pop(context);
                    check_list_type = 'Дверь';
                    setState(() {
                      check_list.add(check_list_type);
                    });
                    check_list_type = '';
                    showDialog(context: context, builder: (BuildContext) {
                      return AlertDialog(
                        title: Text("Добавить описание"),
                        content: TextField(
                          onChanged: (String value){
                            description = value;
                          },
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: (){
                                setState(() {
                                  check_list_desc.add(description);
                                });
                                description = '';
                                Navigator.of(context).pop();

                                print(check_list);
                              },
                              child: Text("Добавить"))
                        ],
                      );
                    });
                  },
                  child: Text('Дверь', style: TextStyle(fontSize: 20),),
                ),
                SimpleDialogOption(
                  padding: EdgeInsets.symmetric(horizontal: 24,vertical: 10),
                  onPressed: () async{
                    Navigator.pop(context);
                    int i = await DatabaseHelper.instance.insert({DatabaseHelper.columnName:'Окно'});
                    print(i);
                    check_list.add('Окно');
                    showDialog(context: context, builder: (BuildContext) {
                      return AlertDialog(
                        title: Text("Добавить описание"),
                        content: TextField(
                          onChanged: (String value){
                            description = value;
                          },
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: (){
                                setState(() {
                                  check_list_desc.add(description);
                                });
                                description = '';
                                Navigator.of(context).pop();
                              },
                              child: Text("Добавить"))
                        ],
                      );
                    });
                  },
                  child: Text('Окно', style: TextStyle(fontSize: 20),),
                ),
              ],
            );
          });
    },
    ),
    );
  }
}


