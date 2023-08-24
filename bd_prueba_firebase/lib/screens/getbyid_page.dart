import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../backend/models/person.dart'; // Asegúrate de importar el modelo correcto
import '../backend/services/person_services.dart'; // Importa el servicio adecuado

class GetByIdPage extends StatefulWidget {
  const GetByIdPage({super.key});

  @override
  _GetByIdPageState createState() => _GetByIdPageState();
}

class _GetByIdPageState extends State<GetByIdPage> {
  final TextEditingController _idController = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;
  Person? _object;

  static const String titleTest = "Test Get Person By ID";
  static const String fieldTest =
      "Person Phone Number"; // Cambia el nombre del campo

  void _getByPhoneNumber() async {
    // Cambia el nombre del método
    try {
      final phoneNumber = int.parse(_idController.text);
      final person = await getByPhoneNumber(phoneNumber);
      setState(() {
        _object = person;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al obtener el documento: $e')),
      );
    }
  }

  @override
  void dispose() {
    _idController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(titleTest),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _idController,
              decoration: const InputDecoration(labelText: fieldTest),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _getByPhoneNumber,
              child: const Text('Get by Phone Number'),
            ),
            SizedBox(height: 16.0),
            if (_object !=
                null) // Agrega esta condición para mostrar la información
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Person Name: ${_object!.personName}'),
                      Text('Email: ${_object!.email}'),
                      Text('Main Hobbie: ${_object!.hobbies?[0]}'),
                      Text('Sex: ${_object!.personSex}'),
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



// import 'package:bd_prueba_firebase/backend/services/person_services.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import '../backend/models/person.dart';
// import '../backend/services/api_services.dart';
// import '../text_information/collections_text.dart';

// class GetByIdPage extends StatefulWidget {
//   const GetByIdPage({super.key});

//   @override
//   _GetByIdPageState createState() => _GetByIdPageState();
// }

// class _GetByIdPageState extends State<GetByIdPage> {
//   final TextEditingController _idController = TextEditingController();
//   static const String collection = CollectionsText.peopleCollection;
//   FirebaseFirestore db = FirebaseFirestore.instance;
//   Person? _object;

//   static const String titleTest = "Test Get Person By ID";
//   static const String fieldTest = "Person ID";

//   void _getById() async {
//     try {
//       await getByPhoneNumber(int.parse(_idController.text));
//       // ApiService<Person> personService =
//       //     ApiService<Person>(db.collection(collection));
//       // final id = _idController.text;
//       // final person = await personService.getById(
//       //     id, (snapshot) => Person.fromFirestore(snapshot));
//       // setState(() {
//       //   _object = person;
//       //   if (_object != null) {}
//       //});
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error al obtener el documento: $e')),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     _idController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(titleTest),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _idController,
//               decoration: const InputDecoration(labelText: fieldTest),
//             ),
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: _getById,
//               child: const Text('Get by ID'),
//             ),
//             SizedBox(height: 16.0),
//             Card(
//               child: Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Person Name: ${_object!.personName}'),
//                     Text('Email: ${_object!.email}'),
//                     Text('Main Hobbie: ${_object!.hobbies?[0]}'),
//                     Text('Sex: ${_object!.personSex}'),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
