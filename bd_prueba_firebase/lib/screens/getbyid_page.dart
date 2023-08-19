import 'package:flutter/material.dart';
import '../backend/models/person.dart';
import '../backend/services/person_services.dart';

class GetByIdPage extends StatefulWidget {
  @override
  _GetByIdPageState createState() => _GetByIdPageState();
}

class _GetByIdPageState extends State<GetByIdPage> {
  final TextEditingController _idController = TextEditingController();

  // Change the information
  Person? _object;

  static const String titleTest = "Test Get Person By ID";
  static const String fieldTest = "Person ID";

  void _getById() async {
    final personId = _idController.text;
    final person = await getPersonById(personId);
    setState(() {
      _object = person;
    });
  }

// ---------------------------
  @override
  void dispose() {
    _idController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleTest),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _idController,
              decoration: InputDecoration(labelText: fieldTest),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _getById,
              child: Text('Get by ID'),
            ),
            SizedBox(height: 16.0),
            if (_object != null)
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // -------------------------------------
                      Text('Person Name: ${_object!.personName}'),
                      Text('Email: ${_object!.email}'),
                      Text('Main Hobbie: ${_object!.hobbies?[1]}'),
                      Text('Sex: ${_object!.personSex}'),
                      // ... Add more fields here
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
