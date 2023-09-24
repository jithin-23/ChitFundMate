import 'package:flutter/material.dart';
import 'sqlHelper.dart';
class JoinChitPage extends StatefulWidget {
  const JoinChitPage({Key? key}) : super(key: key);

  @override
  State<JoinChitPage> createState() => _JoinChitPageState();
}

class _JoinChitPageState extends State<JoinChitPage> {
  @override
  Future<void> _addItem(String name, String totAmount, String totDuartion) async {
    await SQLHelper.createItem(
        name, "Joined", totAmount, totDuartion, "5");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        title: const Text(
          "ChitFundMate",
        ),
        centerTitle: true,
        elevation: 5,
      ),
      body: Column(
        children: [
          Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text(
                "Parvathy's Chit",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(
                "2 lakh for 20 months",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: SizedBox(
                width: 130,
                child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.info)),
                    ElevatedButton(
                      onPressed: () {
                        _addItem("Parvathy's Chit", "2 lakh","20 months");
                        Navigator.of(context).pop();
                      },
                      child: Text("Join"),
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    )
                  ],
                ),
              ),
            ),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text(
                "Chit for Ward 17",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(
                "50,000 for 12 months",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: SizedBox(
                width: 130,
                child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.info)),
                    ElevatedButton(
                      onPressed: () {
                        _addItem("Chit for Ward 17", "50000","12 months");
                        Navigator.of(context).pop();
                      },
                      child: Text("Join"),
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    )
                  ],
                ),
              ),
            ),
          ),
          Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text(
                "Akshaya Chit",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(
                "1 lakh for 12 months",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: SizedBox(
                width: 130,
                child: Row(
                  children: [
                    IconButton(onPressed: () {

                    }, icon: Icon(Icons.info)),
                    ElevatedButton(
                      onPressed: () {_addItem("Akshaya Chit", "1 lakh","12 months");
                      Navigator.of(context).pop(); Navigator.of(context).pop();},
                      child: Text("Join"),
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
