import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  static const routeName = "/form";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Text('Form'),
      ),
    );
  }
}
