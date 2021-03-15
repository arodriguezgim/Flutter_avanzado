import 'package:flutter/material.dart';
import 'package:flutter_api_rest/widgets/circle.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
                top: -140,
                right: -50,
                child: Circle(
                  size: 340,
                  colors: [Colors.pinkAccent, Colors.pink],
                )),
            Positioned(
                top: -100,
                left: -50,
                child: Circle(
                  size: 240,
                  colors: [Colors.orange, Colors.deepOrangeAccent],
                )),
          ],
        ),
      ),
    );
  }
}
