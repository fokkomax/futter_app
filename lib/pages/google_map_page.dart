import 'package:flutter/material.dart';

class GoogleMapPage extends StatefulWidget {
  final String hn;
  final String name;
  GoogleMapPage(this.hn, [this.name]);

  @override
  _GoogleMapPageState createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
      ),
      body: Center(
        child: Text(
          '${widget.hn} & ${widget.name ?? '-'}',
          style: TextStyle(fontSize: 60),
        ),
      ),
    );
  }
}
