import 'package:flutter/material.dart';
import '../backend/models/person.dart';
import '../backend/services/person_services.dart';

class PutPage extends StatelessWidget {
  final TextEditingController _personIdController = TextEditingController();
  //static const String personId = "PEk7a0Ytea8G5wgCJBzq";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Info'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Ingresa el Person ID para editar:'),
            SizedBox(height: 8.0),
            TextField(
              controller: _personIdController,
              decoration: InputDecoration(labelText: 'Person ID'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final personId = _personIdController.text;
                _updatePerson(context, personId);
              },
              child: Text('Update Person'),
            ),
          ],
        ),
      ),
    );
  }

  void _updatePerson(BuildContext context, String personId) async {
    final updatedPerson = Person(
        personName: 'Luis', // Nombre
        paternalLastName: 'Ferrufino', // 1er apellido
        maternalLastName: 'Burgos', // 2do apellido
        phoneNumber: 65942169, // Celular
        email: 'ljesus@example.com', // Correo
        userName: 'luisyisus', // Usuario
        personSex: 'Male', // Sexo
        birthDate: DateTime(2002, 11, 21), // Fecha de nacimiento
        hobbies: [
          'Videogames',
          'Natación',
          'Futbol',
          'Volleyball',
          'Leer',
        ], // Hobbies [] --> Solo acepta 5, si se vuelven 6 se hace nulo
        civilStatus: 'Divorcied',
        registerDate: DateTime(2023, 8, 6),
        profilePhoto: 'profile-photo-url',
        facebookAccount: 'jesus_facebook.com',
        instagramAccount: '@instaJesus',
        twitterAccount: 'luisTweet',
        linkedinAccount: 'luis_Linkedin');

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
          title: Text('Update Result'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
