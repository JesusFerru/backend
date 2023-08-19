import 'package:flutter/material.dart';

import '../backend/models/person.dart';
import '../backend/services/person_services.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  int _counter = 0;

  void post_Counter() async {
    Person newPerson = Person(
        personName: 'Luis', // Nombre
        paternalLastName: 'De', // 1er apellido
        maternalLastName: 'Tal', // 2do apellido
        phoneNumber: 80000011, // Celular
        email: 'Luis@example.com', // Correo
        userName: 'sutanito', // Usuario
        personSex: 'Male', // Sexo
        birthDate: DateTime(2000, 12, 25), // Fecha de nacimiento
        hobbies: [
          'Videogames',
          'Tennis',
          'Futbol',
          'Volleyball',
          'Sleeping',
        ], // Hobbies [] --> Solo acepta 5, si se vuelven 6 se hace nulo
        civilStatus: 'Divorcied',
        registerDate: DateTime(2023, 8, 6),
        profilePhoto: 'profile-photo-url',
        facebookAccount: 'jesus_facebook.com',
        instagramAccount: '@instaJesus',
        twitterAccount: 'JesusTweet',
        linkedinAccount: 'luis_Linkedin');
    setState(() {
      _counter++;
    });
    await postPerson(newPerson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Colors.lightBlue, //Theme.of(context).colorScheme.inversePrimary,
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
              'Create Person',
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
