import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(onPressed: (){
           Navigator.pushNamed(context, '/first');
        },
        child: Text('Go to main flow.'),),
      ),
    );
  }
}
