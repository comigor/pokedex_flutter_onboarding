import 'package:flutter/material.dart';
import 'package:pokedex/widgets/listing.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String filter = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (t) {
            setState(() {
              filter = t;
            });
          },
          decoration: InputDecoration(
            suffix: Icon(Icons.search),
          ),
        ),
      ),
      body: Listing(filter: filter),
    );
  }
}
