import 'package:flutter/material.dart';
import 'package:hackathon_cnt/widgets/highways_list.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: HighwaysList(),
    );
  }
}
