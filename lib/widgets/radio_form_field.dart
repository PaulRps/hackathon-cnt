import 'package:flutter/material.dart';

class RadioOption<T> {
  final String label;
  final T value;

  RadioOption({
    this.label,
    this.value,
  });
}

class RadioFormField<T> extends StatefulWidget {
  final String title;
  final T value;
  final ValueChanged onChange;
  final List<RadioOption<T>> options;

  RadioFormField({
    this.value,
    this.onChange,
    this.options,
    this.title,
  });

  @override
  _RadioFormFieldState createState() => _RadioFormFieldState();
}

class _RadioFormFieldState extends State<RadioFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
          child: Text(widget.title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
              )),
        ),
        ...widget.options
            .map(
              (option) => RadioListTile(
                title: Text(option.label),
                value: option.value,
                groupValue: widget.value,
                onChanged: widget.onChange,
                dense: true,
              ),
            )
            .toList(),
      ],
    );
  }
}
