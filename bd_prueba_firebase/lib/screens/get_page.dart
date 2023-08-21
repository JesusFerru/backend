import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../backend/models/person.dart';
import '../backend/services/base_services.dart';
import '../text_information/collections_text.dart';
//import '../backend/services/person_services.dart';

class GetPage extends StatelessWidget {
  static const String collection = CollectionsText.peopleCollection;
  final BaseService<Person> personService =
      BaseService<Person>(FirebaseFirestore.instance.collection(collection));

  GetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of People'),
      ),
      body: FutureBuilder<List<Person>>(
        future: personService.getAll((snapshot) => Person.fromFirestore(
            snapshot)), // Proporciona la función fromFirestore
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
            List<Person> peopleList = snapshot.data!;

            return ListView.builder(
              itemCount: peopleList.length,
              itemBuilder: (context, index) {
                return Text("${peopleList[index].personName} "
                    " ${peopleList[index].email} "
                    "${peopleList[index].hobbies} "
                    "${peopleList[index].personSex}");
              },
            );
          }
        },
      ),
    );
  }
}


// class GetPage extends StatelessWidget {
//   static const String collection = CollectionsText.peopleCollection;
//   FirebaseFirestore db = FirebaseFirestore.instance;
//   final BaseService<Person> personService = BaseService<Person>(db.collection(collection));
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('List of People'),
//       ),
//       body: FutureBuilder<List<Person>>(
//         future: getAll(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(
//               child: Text('No data available.'),
//             );
//           } else {
//             List peopleList = snapshot.data!;
//             return ListView.builder(
//               itemCount: peopleList.length,
//               itemBuilder: (context, index) {
//                 return Text("${peopleList[index]['personName']} "
//                     " ${peopleList[index]['email']} "
//                     "${peopleList[index]['hobbies']} "
//                     "${peopleList[index]['personSex']}");
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
