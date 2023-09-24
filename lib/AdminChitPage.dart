import 'package:flutter/material.dart';
import 'dart:math';

class AdminChitPage extends StatefulWidget {
  const AdminChitPage(
      {Key? key,
      required this.name,
      required this.totAmount,
      required this.totDuration,
      required this.commission})
      : super(key: key);

  final String name;
  final String totAmount;
  final String totDuration;
  final String commission;

  @override
  State<AdminChitPage> createState() => _AdminChitPageState();
}

class _AdminChitPageState extends State<AdminChitPage> {
  int generateRandomNumber() {
    final List<int> numbers = [2, 4, 5, 8, 9];
    final Random random = Random();
    final int randomIndex = random.nextInt(numbers.length);
    return numbers[randomIndex];
  }
  void _showResultPopup(BuildContext context, int randomNumber) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("This month's winner"),
          content: Text('The randomly selected number is: Member $randomNumber'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
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
                Text(
                  "Commsion income: " + "${widget.commission}"+"%",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Add your action here
                  },
                  child: Text("Edit Database"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your action here
                  },
                  child: Text("Chat with Members"),
                ),
                ElevatedButton(
                  onPressed: () {
                    final int randomNumber = generateRandomNumber();
                    _showResultPopup(context, randomNumber);
                  },
                  child: Text("Pick this Month's Chit Receiver"),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("This Month's Chit Receiver: "),
                    Text(
                      "Not Selected",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red, // Change the color as needed
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                buildMemberRow("Member 1", chitReceived: true),
                buildMemberRow("Member 2", chitReceived: false),
                buildMemberRow("Member 3", chitReceived: true),
                buildMemberRow("Member 4", chitReceived: false),
                buildMemberRow("Member 5", chitReceived: false),
                buildMemberRow("Member 6", chitReceived: true),
                buildMemberRow("Member 7", chitReceived: true),
                buildMemberRow("Member 8", chitReceived: false),
                buildMemberRow("Member 9", chitReceived: false),
                buildMemberRow("Member 10", chitReceived: true),
                // Add more member rows as needed
              ],
            ),
          ],
        ));
  }

  Widget buildMemberRow(String memberName, {required bool chitReceived}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 10, 0),
          child: ElevatedButton(
            onPressed: () {
              // Add your action here
            },
            child: Text(memberName),
          ),
        ),
        Text(
          "Chit Received: ${chitReceived ? 'Yes' : 'No'}",
          style: TextStyle(color: chitReceived ? Colors.green : Colors.red),
        ),
      ],
    );
  }
}
