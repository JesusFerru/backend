import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../backend/models/person.dart';
import '../backend/services/base_services.dart';
import '../text_information/collections_text.dart';

class DeletePage extends StatefulWidget {
  @override
  _DeletePageState createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  final _personIdController = TextEditingController();
  static const String collection = CollectionsText.peopleCollection;
  FirebaseFirestore db = FirebaseFirestore.instance;

  static const String titleTest = "Test Delete Person By ID";
  static const String fieldTest = "Person ID";

  void deleteTest() async {
    try {
      BaseService<Person> personService = BaseService<Person>(
        db.collection(collection),
      );
      final id = _personIdController.text;
      await personService.delete(id);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Eliminado correctamente'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al eliminar: $e')),
      );
    }
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8.0),
            TextField(
              controller: _personIdController,
              decoration: const InputDecoration(labelText: fieldTest),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: deleteTest,
              child: const Text('Eliminar'),
            ),
          ],
        ),
      ),
    );
  }
}



// class DeletePage extends StatefulWidget {
//   @override
//   _DeletePageState createState() => _DeletePageState();
// }

// class _DeletePageState extends State<DeletePage> {
//   final _personIdController = TextEditingController();

//   static const String titleTest = "Test Delete Person By ID";
//   static const String fieldTest = "Person ID";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(titleTest),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(height: 8.0),
//             TextField(
//               controller: _personIdController,
//               decoration: InputDecoration(labelText: fieldTest),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () async {
//                 final personId = _personIdController.text;
//                 try {
//                   //Cambiar metodo
//                   await deletePerson(personId);
//                   //-------------------
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text('Eliminadao correctamente'),
//                     ),
//                   );
//                 } catch (e) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text('Error al eliminar : $e'),
//                     ),
//                   );
//                 }
//               },
//               child: Text('Eliminar'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
