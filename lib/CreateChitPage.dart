import 'package:flutter/material.dart';
import 'sqlHelper.dart';
import 'HomePage.dart';

class CreateChitPage extends StatefulWidget {
  const CreateChitPage({Key? key}) : super(key: key);

  @override
  State<CreateChitPage> createState() => _CreateChitPageState();
}

class _CreateChitPageState extends State<CreateChitPage> {
  List<Widget> mode = <Widget>[
    Text('Monthly'),
    Text('Weekly'),
  ];
  final List<bool> _selectedMode = <bool>[true, false];
  String modeText = "months";

  List<Widget> plan = <Widget>[Text('Equal Split'), Text('Custom Split')];
  final List<bool> _selectedPlan = <bool>[true, false];

  var nameController = TextEditingController();
  var totAmountController = TextEditingController();
  var numOfMemberController = TextEditingController();
  var numOfWeekController = TextEditingController();
  var paymentAmountController = TextEditingController();
  var commissionController = TextEditingController();

  void calcPayment() {
    int totAmount = int.tryParse(totAmountController.text) ?? 0;
    int numOfMember = int.tryParse(numOfMemberController.text) ?? 0;
    int numOfWeek = int.tryParse(numOfWeekController.text) ?? 0;

    int amountperWeek = (totAmount / (numOfWeek * numOfMember)).toInt();
    paymentAmountController.text = amountperWeek.toString();
  }

  Future<void> _addItem() async {
    await SQLHelper.createItem(
        nameController.text,
        "Owned",
        totAmountController.text,
        numOfWeekController.text + " " + modeText,
        commissionController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ChitFundMate"),
          centerTitle: true,
          elevation: 3,
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Text(
                    "Create new Chit",
                    style: TextStyle(fontSize: 35),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "  Name of Chit  ",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Container(
                        height: 50,
                        width: 150,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: nameController,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "  Total Amount  ",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Container(
                        height: 50,
                        width: 150,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: totAmountController,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 1, 10),
                      child: Text(
                        "Number of members",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Container(
                        height: 50,
                        width: 150,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: numOfMemberController,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        "Number of " + modeText,
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Container(
                        height: 50,
                        width: 150,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: numOfWeekController,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Frequency",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    ToggleButtons(
                      //direction: vertical ? Axis.vertical : Axis.horizontal,
                      onPressed: (int index) {
                        setState(() {
                          // The button that is tapped is set to true, and the others to false.
                          for (int i = 0; i < _selectedMode.length; i++) {
                            _selectedMode[i] = i == index;
                          }
                          if (index == 0) {
                            modeText = "month";
                          } else {
                            modeText = "week ";
                          }
                          calcPayment();
                        });
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      selectedBorderColor: Colors.blue[700],
                      selectedColor: Colors.white,
                      fillColor: Colors.blue[200],
                      color: Colors.blue[400],
                      constraints: const BoxConstraints(
                        minHeight: 40.0,
                        minWidth: 80.0,
                      ),
                      isSelected: _selectedMode,
                      children: mode,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        "Payment per " + modeText,
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Container(
                        height: 50,
                        width: 150,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: paymentAmountController,
                            enabled: false,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Payment Plan",
                      style: TextStyle(fontSize: 16),
                    ),
                    ToggleButtons(
                      //direction: vertical ? Axis.vertical : Axis.horizontal,
                      onPressed: (int index) {
                        setState(() {
                          // The button that is tapped is set to true, and the others to false.
                          for (int i = 0; i < _selectedPlan.length; i++) {
                            _selectedPlan[i] = i == index;
                          }
                        });
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      selectedBorderColor: Colors.blue[700],
                      selectedColor: Colors.white,
                      fillColor: Colors.blue[200],
                      color: Colors.blue,
                      constraints: const BoxConstraints(
                        minHeight: 40.0,
                        minWidth: 90.0,
                      ),
                      isSelected: _selectedPlan,
                      children: plan,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Create a custom plan: "),
                    TextButton(onPressed: () {}, child: Text("click here"))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        "Commission",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Container(
                        height: 50,
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: commissionController,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                        )),
                    Text("%")
                  ],
                ),
                SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            String name = nameController.text;
                            String totAmount = totAmountController.text;
                            String numMember = numOfMemberController.text;
                            String numWeek = numOfWeekController.text;
                            String paymentPerWeek =
                                paymentAmountController.text;
                            String commission = commissionController.text;

                            if (name.isEmpty ||
                                totAmount.isEmpty ||
                                numMember.isEmpty ||
                                numWeek.isEmpty ||
                                commission.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Enter all details")));
                            } else if (int.parse(commission) >= 100) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text("Enter valid commission rate")));
                            } else {
                              _addItem();
                              Navigator.of(context).pop();
                            }
                          });
                        },
                        child: Text("Create")))
              ],
            )
          ],
        ));
  }
}
