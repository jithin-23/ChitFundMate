import 'package:chitfundmate/HomePage.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _checkbox = false;
  var fnameController = TextEditingController();
  var lnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  var fname = ' ',
      lname = ' ',
      email = ' ',
      password = ' ',
      confirmPassword = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChitFundMate"),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView(
        children: [
          Column(children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
              child: Text(
                "Hey There",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text("Create Account",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 10, 50, 15),
              child: TextField(
                controller: fnameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("user Name")),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 10, 50, 15),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("Phone number")),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 10, 50, 15),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("Password")),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 10, 50, 5),
              child: TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Confirm Password")),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, bottom: 5),
                  child: Checkbox(
                    activeColor: Colors.deepOrange,
                    value: _checkbox,
                    onChanged: (value) {
                      setState(() {
                        _checkbox = !_checkbox;
                      });
                    },
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    width: 400,
                    child: Text(
                      "By creating an account, you agree to our Conditions of Use and Privacy Notice",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SizedBox(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange),
                      onPressed: () {
                        setState(() {
                          fname = fnameController.text;
                          lname = lnameController.text;
                          email = emailController.text;
                          password = passwordController.text;
                          confirmPassword = confirmPasswordController.text;

                          if (fname.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Enter your first name")));
                          } else if (email.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Enter your phone Number")));
                          } else if (password.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Enter your password")));
                          } else if (confirmPassword.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Enter confirm password")));
                          } else if (confirmPassword != password) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Passwords do not match")));
                          } else if (!_checkbox) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Check privacy policy")));
                          } else
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                        });
                      },
                      child: Text("Register"))),
            ),
            TextButton(
                style: TextButton.styleFrom(foregroundColor: Colors.deepOrange),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Back to Login")),
            //Text(fname)
          ])
        ],
      ),
    );
  }
}
