import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makanlah/main_screen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String value = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          '',
          style: TextStyle(
              fontFamily: 'Varela', fontSize: 20.0, color: Color(0xFF545D68)),
        ),
        actions: <Widget>[],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('MAKANLAH',
                    style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 42.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue)),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Write your name here...',
                ),
                onChanged: (text) {
                  value = text;
                },
              ),
              SizedBox(height: 20),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return MainScreen(value: value);
                        }));

                    // showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return AlertDialog(
                    //         content: Text('Hello, $_name'),
                    //       );
                    //     });
                  },
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
