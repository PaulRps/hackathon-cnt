import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class CoordinatesFormField extends StatefulWidget {
  @override
  _CoordinatesFormFieldState createState() => _CoordinatesFormFieldState();
}

class _CoordinatesFormFieldState extends State<CoordinatesFormField> {
  TextEditingController _latController;
  TextEditingController _lngController;

  @override
  void initState() {
    super.initState();
    _latController = TextEditingController();
    _lngController = TextEditingController();
  }

  @override
  void dispose() {
    _latController.dispose();
    _lngController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(right: 8),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _latController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Latitude',
                  isDense: true,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _lngController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Longitude',
                  isDense: true,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: FlatButton(
              child: Icon(Icons.gps_fixed),
              onPressed: () async {
                Position position = await Geolocator.getCurrentPosition(
                    desiredAccuracy: LocationAccuracy.high);
                _lngController.text = position.longitude.toString();
                _latController.text = position.latitude.toString();
              },
            ),
          ),
        ],
      ),
    );
  }
}
