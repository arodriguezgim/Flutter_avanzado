import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  const InputText({Key key, this.label = ''}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: this.label,
          labelStyle:
              TextStyle(color: Colors.black45, fontWeight: FontWeight.w500)),
    );
  }
}
