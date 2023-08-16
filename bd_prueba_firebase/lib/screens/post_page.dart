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

  void _incrementCounter() async {
    // const personId = '6xTeeVnriACZ50MGmbxi';

    // // Obtener una persona por su ID
    // getPersonById(personId).then((person) {
    //   if (person != null) {
    //     logger.info('Persona encontrada: ${person.personName}');
    //   } else {
    //     logger.info('Persona no encontrada');
    //   }
    // });

    Person newPerson = Person(
        personName: 'Jesus', // Nombre
        paternalLastName: 'De', // 1er apellido
        maternalLastName: 'Tal', // 2do apellido
        phoneNumber: 80000011, // Celular
        email: 'jesus@example.com', // Correo
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
        linkedinAccount: 'jesus_Linkedin');
    setState(() {
      _counter++;
    });
    await postPerson(newPerson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
