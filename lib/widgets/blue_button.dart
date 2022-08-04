import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BlueButton extends StatelessWidget {
  String text;
  Function onPressed;
  Color color;
  BlueButton(this.text, {required this.onPressed, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      onPressed: () => onPressed(),
    );
  }
}
