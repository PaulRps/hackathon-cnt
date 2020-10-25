import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PictureField extends StatefulWidget {
  const PictureField({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PictureFieldState();
  }
}

class _PictureFieldState extends State<PictureField> {
  final _picker = ImagePicker();
  File _image;

  Future _getImage() async {
    final pickedFile = await _picker.getImage(
      source: ImageSource.camera,
      imageQuality: 100,
    );

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _image != null
            ? Container(
                width: double.infinity,
                height: 300,
                child: Image.file(
                  _image,
                  fit: BoxFit.contain,
                ),
              )
            : null,
        RaisedButton(
          padding: EdgeInsets.all(10),
          child: IntrinsicHeight(
            child: Column(
              children: [
                Icon(Icons.camera_alt),
                Text('foto'),
              ],
            ),
          ),
          onPressed: _getImage,
        )
      ],
    );
  }
}
