// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/hello_listview.dart';
import 'package:flutter_application_1/pages/hello_page1.dart';
import 'package:flutter_application_1/pages/hello_page2.dart';
import 'package:flutter_application_1/pages/hello_page3.dart';
import 'package:flutter_application_1/utils/nav.dart';
import 'package:flutter_application_1/widgets/blue_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Flutter"),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }
}

_body(context) {
  return Container(
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[_text(), _pageView(), _buttons(context)],
    ),
  );
}

_buttons(context) {
  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          BlueButton(
            "ListView",
            onPressed: () => _onClickNavigator(context, HelloListView()),
            color: Colors.red,
          ),
          BlueButton(
            "Page 2",
            onPressed: () => _onClickNavigator(context, HelloPage2()),
          ),
          BlueButton(
            "Page 3",
            onPressed: () => _onClickNavigator(context, HelloPage3()),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          BlueButton("Snack", onPressed: _onClickSnack),
          BlueButton("Dialog", onPressed: _onClickDialog),
          BlueButton("Toast", onPressed: _onClickToast)
        ],
      )
    ],
  );
}

void _onClickNavigator(context, page) async {
  String s = await push(context, page);
}

_onClickDialog() {}

_onClickToast() {}

_onClickSnack() {}

_pageView() {
  return Container(
    height: 300,
    margin: EdgeInsets.only(top: 20, bottom: 20),
    child: PageView(
      children: <Widget>[
        _img("assets/images/dog1.png"),
        _img("assets/images/dog2.png"),
        _img("assets/images/dog3.png"),
        _img("assets/images/dog4.png"),
        _img("assets/images/dog5.png"),
      ],
    ),
  );
}

_img(String img) {
  return Image.asset(
    img,
    fit: BoxFit.cover,
  );
}

_text() {
  return Text(
    'Hello World!',
    style: TextStyle(
      fontSize: 30,
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      decoration: TextDecoration.underline,
      decorationColor: Colors.red,
      decorationStyle: TextDecorationStyle.dotted,
    ),
  );
}
