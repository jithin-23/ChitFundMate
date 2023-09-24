import 'package:chitfundmate/HomePage.dart';
import 'package:chitfundmate/RegisterPage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var unameController = TextEditingController();
  var passwordController = TextEditingController();
  var uname = '', password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ChitFundMate'),
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
        body: ListView(children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                      child: Image.asset(
                    "Images/CFM_Logo.jpg",
                    height: 200,
                    width: 200,
                  )),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
                controller: unameController,
                decoration: InputDecoration(
                    label: Text('Username'), border: OutlineInputBorder())),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  label: Text('Password'), border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        uname = unameController.text;
                        password = passwordController.text;
                        if (uname.isEmpty)
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Enter your user name")));
                        else if (password.isEmpty)
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Enter your password")));
                        else if (uname != 'abc')
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("incorrect username")));
                        else if (password != '123')
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("incorrect password")));
                        else if (uname == 'abc' && password == '123') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ));
                        }
                      });
                    },
                    child: Text("Login")),
              ],
            ),
          ),
          SizedBox(
            child: Column(
              children: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      });
                    },
                    child: Text("Create New Account")),
              ],
            ),
          )
        ]));
  }
}
