import 'package:bd_prueba_firebase/examples/person_ex.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../backend/models/person.dart';

import '../backend/services/base_services.dart';
import '../text_information/collections_text.dart';

// ignore: must_be_immutable
class PutPage extends StatelessWidget {
  final TextEditingController _personIdController = TextEditingController();
  static const String collection = CollectionsText.peopleCollection;
  FirebaseFirestore db = FirebaseFirestore.instance;

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
    BaseService<Person> personService = BaseService<Person>(db.collection(
        collection)); // Reemplaza yourCollectionReference con la referencia correcta

    try {
      await personService.put(
        personId,
        updatedPerson,
        (data) => data
            .toFirestore(), // Aquí se llama al método toFirestore de tu modelo
      );
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
          title: Text('Resultado Actualizado'),
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
