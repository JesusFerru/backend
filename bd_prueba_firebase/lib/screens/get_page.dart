import 'package:flutter/material.dart';
import '../backend/services/person_services.dart';

class GetPage extends StatelessWidget {
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
            List peopleList = snapshot.data!;

            return ListView.builder(
              itemCount: peopleList.length,
              itemBuilder: (context, index) {
                return Text("${peopleList[index]['personName']} "
                    " ${peopleList[index]['email']} "
                    "${peopleList[index]['hobbies']} "
                    "${peopleList[index]['personSex']}");
              },
            );
          }
        },
      ),
    );
  }
}
