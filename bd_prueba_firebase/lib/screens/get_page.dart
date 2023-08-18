import 'package:flutter/material.dart';

import '../backend/models/person.dart';
import '../backend/services/person_services.dart';

class GetPage extends StatelessWidget {
  // final List peopleList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of People'),
      ),
      body: FutureBuilder(
        future: getPerson(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No data available.'),
            );
          } else {
            List peopleList =
                snapshot.data!; // Obtiene la lista de personas del snapshot
            return ListView.builder(
              itemCount: peopleList.length,
              itemBuilder: (context, index) {
                Person person = Person.fromFirestore(
                  peopleList[index], // Obtén el DocumentSnapshot de la lista
                );
                return ListTile(
                  title: Text(person.personName),
                  subtitle: Text(person.personSex), // Cambia a personSex
                );
              },
            );
          }
        },
      ),
    );
  }
}
           






           
//             if (snapshot.hasData) {
//               return ListView.builder(
//                 itemCount: peopleList.length,
//                 itemBuilder: (context, index) {
//                   Map<String, dynamic> personData = peopleList[index];
//                   return ListTile(
//                     title: Text(personData['personName']),
//                     subtitle: Text(personData['sex']),
//                   );
//                 },
//               );
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           })),
//     );
//   }
// }
