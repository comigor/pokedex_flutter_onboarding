import 'package:flutter/material.dart';

class SinglePokemonPage extends StatelessWidget {
  final String id;

  SinglePokemonPage(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            FlutterLogo(size: 256),
            Text(
              id,
              style: TextStyle(fontSize: 72),
            ),
          ],
        ),
      ),
    );
  }
}
