import 'package:flutter/material.dart';
import 'package:flutter_api_rest/utils/responsive.dart';
import 'package:flutter_api_rest/widgets/input_text.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Positioned(
      bottom: 30,
      left: 20,
      right: 20,
      child: Column(
        children: [
          InputText(
            keyboardType: TextInputType.emailAddress,
            label: 'DIRECCION EMAIL',
            fontSize: responsive.dp(1.5),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12))),
            child: Row(
              children: [
                Expanded(
                  child: InputText(
                    label: 'PASSWORD',
                    obscureText: true,
                    borderEnabled: false,
                    fontSize: responsive.dp(1.5),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Password Olvidado",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: responsive.dp(5),
          ),
          SizedBox(
              width: double.infinity,
              child: TextButton(
                style: ButtonStyle(
                  //padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.pinkAccent),
                ),
                onPressed: () {},
                child: Text('Sign In'),
              )),
          SizedBox(
            height: responsive.dp(3),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "New to friendly Desi?",
                style: TextStyle(fontSize: responsive.dp(1.5)),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.pinkAccent, fontSize: responsive.dp(1.6)),
                ),
              )
            ],
          ),
          SizedBox(
            height: responsive.dp(10),
          ),
        ],
      ),
    );
  }
}
