import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final auth = FirebaseAuth.instance;
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextField(
          decoration: InputDecoration(labelText: "Email"),
          onChanged: (value) {
            setState(() {
              email = value;
            });
          },
        ),
        TextField(
          decoration: InputDecoration(labelText: "Password"),
          onChanged: (value) {
            setState(() {
              password = value;
            });
          },
          obscureText: true,
        ),
        FlatButton(
            onPressed: () {
              try {
                final newuser = auth.createUserWithEmailAndPassword(
                    email: email!, password: password!);
                if (newuser != null) {
                  Navigator.pushNamed(context, '/home');
                }
              } catch (e) {
                print(e);
              }
            },
            child: Text("Sign up")),
      ]),
    );
  }
}
