import 'dart:convert';
import '/main.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:dmapp/main.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../model/task.dart';

class Taskmanager extends StatefulWidget {
  Taskmanager({Key? key}) : super(key: key);

  @override
  State<Taskmanager> createState() => _TaskmanagerState();
}

class _TaskmanagerState extends State<Taskmanager> {
  List _taskdone = [];
  List<Task> _listoftasks = [];
  var listz;

  void _fetchstuff() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? taskz = pref.getString('taskdataz');

    List listz = (taskz == null) ? [] : json.decode(taskz);

    for (var x in listz) {
      _listoftasks.add(Task.fromMap(json.decode(x)));
    }
    setState(() {});
    _taskdone = List.generate(_listoftasks.length, (index) => false);
    print(_listoftasks.last);
  }

  void clearstuff() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('taskdataz');
    print('storage has been cleared');
    _fetchstuff();
  }

  void savestuff() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Task t = Task.fromString(_Taskmanger.text);
    String? taskz = pref.getString('taskdataz');

    List listz = (taskz == null) ? [] : json.decode(taskz);
    print(listz);

    listz.add(json.encode(t.getMapz()));
    print(listz);
    String userdataz = json.encode(listz);
    pref.setString('taskdataz', userdataz);
    Toast.show('Task has been added');
    _fetchstuff();
  }

  var _Taskmanger;
  @override
  void initState() {
    ToastContext().init(context);
    super.initState();
    _Taskmanger = TextEditingController();
    _fetchstuff();
  }

  @override
  void dispose() {
    _Taskmanger.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.save))],
        title: Text('Task manager'),
        backgroundColor: Colors.black,
      ),
      body: _listoftasks == []
          ? Center(
              child: Text(
              'no task added yet',
              style: TextStyle(color: Colors.red),
            ))
          : ListView(
              children: _listoftasks
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black)),
                          margin: EdgeInsets.all(2),
                          height: 60,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(e.task,
                                  style: TextStyle(color: Colors.black)),
                              Checkbox(
                                  key: GlobalKey(),
                                  value: _taskdone[_listoftasks.indexOf(e)],
                                  onChanged: (val) {
                                    setState(() {
                                      _taskdone[_listoftasks.indexOf(e)] = val;
                                    });
                                  })
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        hoverColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              elevation: 200,
              backgroundColor: Colors.black,
              context: context,
              builder: (BuildContext context) => Container(
                    height: 200,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tasks',
                              style: TextStyle(color: Colors.white),
                            ),
                            GestureDetector(
                                onTap: () => Navigator.of(context).pop(),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 2,
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _Taskmanger,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                )),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                onPressed: () => _Taskmanger.text = '',
                                child: Text('RESET')),
                            ElevatedButton(
                                onPressed: () {
                                  (_Taskmanger.text == '')
                                      ? Toast.show('this field cant be empty')
                                      : savestuff();
                                },
                                child: Text('ADD')),
                            ElevatedButton(
                                onPressed: () {
                                  clearstuff();
                                },
                                child: Text('CLEAR STORAGE'))
                          ],
                        )
                      ],
                    ),
                  ));
        },
      ),
    );
  }
}
