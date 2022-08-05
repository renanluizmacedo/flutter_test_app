// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/drawer_list.dart';
import 'package:flutter_application_1/pages/hello_listview.dart';
import 'package:flutter_application_1/pages/hello_page1.dart';
import 'package:flutter_application_1/pages/hello_page2.dart';
import 'package:flutter_application_1/pages/hello_page3.dart';
import 'package:flutter_application_1/utils/nav.dart';
import 'package:flutter_application_1/widgets/blue_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hello Flutter"),
          // ignore: prefer_const_literals_to_create_immutables
          bottom: TabBar(tabs: [
            Tab(text: "Texto 1"),
            Tab(text: "Texto 2"),
            Tab(text: "Texto 3")
          ]),
          centerTitle: true,
        ),
        body: TabBarView(children: [
          _body(context),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.yellow,
          )
        ]),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                _onClickFab();
              },
            ),
            SizedBox(
              width: 8,
            ),
            FloatingActionButton(
              child: Icon(Icons.favorite),
              onPressed: () {
                _onClickFab();
              },
            ),
          ],
        ),
        drawer: DrawerList(),
      ),
    );
  }
}

_body(context) {
  return Container(
    padding: EdgeInsets.only(top: 16),
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[_text(), _pageView(), _buttons(context)],
    ),
  );
}

_buttons(context) {
  return Builder(
    builder: (context) {
      return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BlueButton(
                "ListView",
                onPressed: () => _onClickNavigator(context, HelloListView()),
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
              BlueButton("Snack", onPressed: () => _onClickSnack(context)),
              BlueButton("Dialog", onPressed: () => _onClickDialog(context)),
              BlueButton("Toast", onPressed: () => _onClickToast(context))
            ],
          )
        ],
      );
    },
  );
}

void _onClickNavigator(context, page) async {
  String s = await push(context, page);
}

_onClickDialog(context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: Text("Flutter é muito legal!"),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text("OK!"),
              onPressed: () {
                Navigator.pop(context);
                print("OK");
              },
            ),
          ],
        ),
      );
    },
  );
}

_onClickFab() {
  print("Add");
}

_onClickToast(context) {
  Fluttertoast.showToast(
      msg: "Flutter é muito legal",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}

_onClickSnack(context) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text("Olá Flutter"),
      action: SnackBarAction(
        textColor: Colors.yellow,
        label: "ok",
        onPressed: () {
          print("OK");
        },
      ),
    ),
  );
}

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
