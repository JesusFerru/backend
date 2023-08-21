import 'package:bd_prueba_firebase/backend/models/channel_cat.dart';
import 'package:bd_prueba_firebase/backend/models/person_network.dart';

import 'package:bd_prueba_firebase/backend/services/person_network._services.dart';
import 'package:bd_prueba_firebase/examples/channel_ex.dart';
import 'package:bd_prueba_firebase/examples/per_net_ex.dart';
import 'package:bd_prueba_firebase/examples/person_ex.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../backend/models/person.dart';
import '../backend/services/person_services.dart';
import 'package:bd_prueba_firebase/backend/services/base_services.dart';

import '../text_information/collections_text.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  int _counter = 0;
  static const String createDocument = 'Crear Documento';
  static const String collection = CollectionsText.peopleCollection;
  FirebaseFirestore db = FirebaseFirestore.instance;

  void post_Counter() async {
    setState(() {
      _counter++;
    });
    try {
      BaseService<Person> personService = BaseService<Person>(
        db.collection(collection),
      );

      await personService.post(personExample(), (data) => data.toFirestore());

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Documento en $collection agregado correctamente.')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al agregar el documento: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text("Prueba Create"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              createDocument,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: post_Counter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
