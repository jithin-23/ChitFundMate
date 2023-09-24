import 'package:chitfundmate/CreateChitPage.dart';
import 'package:chitfundmate/JoinChitPage.dart';
import 'package:chitfundmate/JoinedChitPage.dart';
import 'package:flutter/material.dart';

import 'AdminChitPage.dart';
import 'sqlHelper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _journals = [];

  //This function is used to fetch all data from the database
  void _refreshJournals() async {
    var data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
    });
  }

  //Loading the diary when the app starts
  @override
  void initState() {
    super.initState();
    _refreshJournals();
  }

  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    _refreshJournals();
  }

  void bottomSheet() async {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      isScrollControlled: true,
      elevation: 10,
      context: context,
      builder: (context) => SizedBox(
        height: 200,
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 30,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 15, 8, 5),
                child: Text(
                  "New Chit",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateChitPage()));
                          _refreshJournals();
                        });
                      },
                      child: Text("Create new Chit")),
                ),
              ),
              SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JoinChitPage()));

                        setState(() {
                          _refreshJournals();
                        });
                      },
                      child: Text("Join new Chit")))
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChitFundMate"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                _refreshJournals();
              },
              icon: Icon(Icons.refresh)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
        ],
      ),
      body: ListView.builder(
        itemCount: _journals.length,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        itemBuilder: (context, index) => Card(
          color: (_journals[index]['description'] == 'Owned')
              ? Colors.green[400]
              : Colors.yellow,
          elevation: 3,
          margin: EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _journals[index]['title'] +
                    "  " +
                    _journals[index]['totalAmount'],
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 8),
              child: Text(
                _journals[index]['description'],
                style: TextStyle(
                    color: (_journals[index]['description'] == 'Owned')
                        ? Colors.white
                        : Colors.red,
                    fontSize: 16),
              ),
            ),
            trailing: SizedBox(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        if (_journals[index]['description'] == 'Owned') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminChitPage(
                                        name: _journals[index]['title'],
                                        totAmount: _journals[index]
                                            ['totalAmount'],
                                        totDuration: _journals[index]
                                            ['totalDuration'],
                                        commission: _journals[index]
                                            ['commission'],
                                      )));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => JoinedChitPage(
                                        name: _journals[index]['title'],
                                        totAmount: _journals[index]
                                            ['totalAmount'],
                                        totDuration: _journals[index]
                                            ['totalDuration'],
                                      )));
                        }
                      },
                      icon: Icon(Icons.info,
                          color: (_journals[index]['description'] == 'Owned')
                              ? Colors.white
                              : Colors.black)),
                  IconButton(
                      onPressed: () => _deleteItem(
                            _journals[index]['id'],
                          ),
                      icon: Icon(Icons.delete, color: Colors.red)),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        onPressed: () {
          /* Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateChitPage()));*/
          bottomSheet();
          _refreshJournals();
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
