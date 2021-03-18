import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      left: 20,
      right: 20,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                labelText: "DIRECCION EMAIL",
                labelStyle: TextStyle(
                    color: Colors.black45, fontWeight: FontWeight.w500)),
          )
        ],
      ),
    );
  }
}
