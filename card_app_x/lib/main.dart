import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple[600],
        body: Card(
          margin: EdgeInsets.symmetric(vertical: 120.0, horizontal: 15.0),
          color: Colors.purple[200],
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    'https://cdn0.iconfinder.com/data/icons/avatar-vol-2-4/512/10-512.png'),
              ),
              Text(
                "Angela Yu",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontFamily: 'Pacifico',
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text("FASHION DESIGNER",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.purple[50],
                    fontFamily: 'Montserrat',
                    letterSpacing: 2.4,
                  )),
              SizedBox(
                height: 20.0,
                width: 180.0,

                child: Divider(
                  color: Colors.white,
                )),

              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 30.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.purple,
                  ),
                  title: Text(
                    "+91 77985 77985",
                    style: new TextStyle(
                        color: Colors.purple,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 30.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.purple,
                  ),
                  title: Text(
                    "angela.yu@abc.xyz",
                    style: new TextStyle(
                        color: Colors.purple,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
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
