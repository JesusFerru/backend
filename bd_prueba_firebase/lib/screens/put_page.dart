import 'package:bd_prueba_firebase/examples/person_ex.dart';
import 'package:flutter/material.dart';
import '../backend/services/person_services.dart';

class PutPage extends StatelessWidget {
  final TextEditingController _personIdController = TextEditingController();
  static const String requestTest = 'Ingresa el Person ID para editar:';
  static const String fieldTest = "Person ID";

  PutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(fieldTest),
            const SizedBox(height: 8.0),
            TextField(
              controller: _personIdController,
              decoration: const InputDecoration(labelText: fieldTest),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final personId = _personIdController.text;
                _updatePerson(context, personId);
              },
              child: const Text('Update Person'),
            ),
          ],
        ),
      ),
    );
  }

  void _updatePerson(BuildContext context, String personId) async {
    final updatedPerson = personExample();

    try {
      await putPerson(personId, updatedPerson);
      _showDialog(context, 'Actualizado exitosamente.');
    } catch (e) {
      _showDialog(context, 'Error al actualizar: $e');
    }
  }

  void _showDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update Result'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
