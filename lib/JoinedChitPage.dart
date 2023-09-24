import 'package:flutter/material.dart';

class JoinedChitPage extends StatefulWidget {
  const JoinedChitPage({
    Key? key,
    required this.name,
    required this.totAmount,
    required this.totDuration,
  }) : super(key: key);

  final String name;
  final String totAmount;
  final String totDuration;

  @override
  State<JoinedChitPage> createState() => _JoinedChitPageState();
}

class _JoinedChitPageState extends State<JoinedChitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChitFundMate"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                '${widget.name}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                "Total Amount: " + "${widget.totAmount}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "Duration: " + "${widget.totDuration}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Image.asset("Images/joined_Chit_Table.png"),
              SizedBox(height: 20),
              Text(
                'Number of cycles completed: 5/' + "${widget.totDuration}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Current cycle payment completed: No',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              Text(
                'Chit received: No',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement logic to contact admin
                },
                child: Text('Contact Admin'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Implement logic to request chit for next cycle
                },
                child: Text('Request Chit for Next Cycle'),
              ),
            ],
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Implement logic to pay this month's due
        },
        label: Text('Pay'),
        icon: Icon(Icons.payment),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
