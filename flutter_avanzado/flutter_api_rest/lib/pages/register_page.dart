import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_rest/utils/responsive.dart';
import 'package:flutter_api_rest/widgets/avatar_button.dart';
import 'package:flutter_api_rest/widgets/circle.dart';
import 'package:flutter_api_rest/widgets/register_form.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = 'register';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    //final Size size = MediaQuery.of(context).size;
    final double pinkSize = responsive.wp(88);
    final double orangeSize = responsive.wp(57);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          //Minimizo el teclado si toco fuera
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: responsive.height,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    top: -pinkSize * 0.3,
                    right: -pinkSize * 0.2,
                    child: Circle(
                      size: pinkSize,
                      colors: [Colors.pinkAccent, Colors.pink],
                    )),
                Positioned(
                    top: -orangeSize * 0.35,
                    left: -orangeSize * 0.15,
                    child: Circle(
                      size: orangeSize,
                      colors: [Colors.orange, Colors.deepOrangeAccent],
                    )),
                Positioned(
                  top: pinkSize * 0.13,
                  child: Column(
                    children: [
                      Text(
                        "Hola! \n Regístrate como nuevo usuario!!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: responsive.dp(1.7), color: Colors.white),
                      ),
                      SizedBox(
                        height: responsive.dp(4.5),
                      ),
                      AvatarButton(
                        imageSize: responsive.wp(25),
                      )
                    ],
                  ),
                ),
                RegisterForm(),
                Positioned(
                    left: 15,
                    top: 15,
                    child: SafeArea(
                      child: CupertinoButton(
                        color: Colors.black26,
                        padding: EdgeInsets.all(10),
                        borderRadius: BorderRadius.circular(30),
                        child: Icon(Icons.arrow_back),
                        onPressed: () {},
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
