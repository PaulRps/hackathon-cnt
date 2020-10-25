import 'package:flutter/material.dart';

class SessionItemOption {
  final String id;
  final String text;

  SessionItemOption(this.id, this.text);
}

class SessionItem extends StatelessWidget {
  final String title;
  final List<SessionItemOption> options;
  final void Function(String) onChange;
  String groupValue;

  SessionItem(
      {@required this.title,
      @required this.options,
      @required this.onChange,
      @required this.groupValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(this.title),
        ...this
            .options
            .map((o) => RadioListTile(
                title: Text(o.text),
                value: o.id,
                groupValue: this.groupValue,
                onChanged: this.onChange,
                activeColor: Colors.green,
                selected: this.groupValue == o.id))
            .toList()
      ],
    );
  }
}
