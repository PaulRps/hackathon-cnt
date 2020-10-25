import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PictureFormField extends StatefulWidget {
  final String value;
  final ValueChanged onChange;

  PictureFormField({
    this.value,
    this.onChange,
  });

  @override
  _PictureFormFieldState createState() => _PictureFormFieldState();
}

class _PictureFormFieldState extends State<PictureFormField> {
  final _picker = ImagePicker();
  File _image;

  _getPicture() async {
    final pickedFile = await _picker.getImage(
      source: ImageSource.camera,
      maxWidth: 1280,
      maxHeight: 720,
    );

    setState(() {
      _image = File(pickedFile.path);
    });
    final imageBytes = await pickedFile.readAsBytes();
    final base64Image = base64Encode(imageBytes);
    widget.onChange(base64Image);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_image != null)
          Container(
            child: Image.file(
              _image,
              fit: BoxFit.contain,
            ),
          ),
        RaisedButton(
          child: Icon(Icons.camera_alt),
          onPressed: _getPicture,
        ),
      ],
    );
  }
}
