import 'package:flutter/material.dart';
import '../backend/models/person.dart';
import '../backend/services/person_services.dart';

class DeletePage extends StatefulWidget {
  @override
  _DeletePageState createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  final _personIdController = TextEditingController();

  static const String titleTest = "Test Delete Person By ID";
  static const String fieldTest = "Person ID";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleTest),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 8.0),
            TextField(
              controller: _personIdController,
              decoration: InputDecoration(labelText: fieldTest),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                final personId = _personIdController.text;
                try {
                  await deletePerson(personId);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Persona eliminada correctamente'),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error al eliminar persona: $e'),
                    ),
                  );
                }
              },
              child: Text('Eliminar'),
            ),
          ],
        ),
      ),
    );
  }
}