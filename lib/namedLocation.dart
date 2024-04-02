import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  TextEditingController _locationController = TextEditingController();
  bool _showErrorMessage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Location'),
        backgroundColor: Colors.cyan[200],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Card(
          color: Colors.cyan[100],
          child: Container(
            constraints: BoxConstraints(minHeight: 200.0, maxHeight: 300.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  controller: _locationController,
                  decoration: InputDecoration(labelText: 'Enter Location'),
                ),
                if (_showErrorMessage) // Show error message if _showErrorMessage is true
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Please enter a valid location.',
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    String location = _locationController.text.trim();
                    if (location.isNotEmpty) {
                      Navigator.pop(context, location);
                    } else {
                      setState(() {
                        _showErrorMessage = true;
                      });
                    }
                  },
                  child: Text(
                    'Get Weather',
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
