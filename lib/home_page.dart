// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/hello_page1.dart';
import 'package:flutter_application_1/pages/hello_page2.dart';
import 'package:flutter_application_1/pages/hello_page3.dart';

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
          _button(context, "ListView",
              () => _onClickNavigator(context, HelloPage1())),
          _button(context, "Page 2",
              () => _onClickNavigator(context, HelloPage2())),
          _button(context, "Page 3",
              () => _onClickNavigator(context, HelloPage3())),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _button(context, "Snack", _onClickSnack),
          _button(context, "Dialog", _onClickDialog),
          _button(context, "Toast", _onClickToast)
        ],
      )
    ],
  );
}

void _onClickNavigator(BuildContext context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }));
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
      ));
}

_button(context, String text, Function onPressed) {
  return RaisedButton(
      color: Colors.blue,
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      onPressed: () => onPressed);
}

_img(String img) {
  return Image.asset(
    img,
    width: 300,
    height: 300,
    fit: BoxFit.contain,
  );
}

_text() {
  return Text('Hello World!',
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
        decorationStyle: TextDecorationStyle.dotted,
      ));
}
