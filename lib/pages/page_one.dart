import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Page One'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xfff9aa33),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15))),
                  height: 100,
                  child: Icon(
                    Icons.person_pin,
                    size: 60,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                  padding: EdgeInsets.all(10),
                  height: 100,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Hawke Fokko',
                        style: TextStyle(fontSize: 15),
                      ),
                      Divider(
                        height: 10,
                      ),
                      Text(
                        'Hello test 123',
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w900),
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
