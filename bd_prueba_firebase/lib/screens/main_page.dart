import 'package:bd_prueba_firebase/screens/post_page.dart';
import 'package:bd_prueba_firebase/screens/put_page.dart';
import 'package:flutter/material.dart';

import 'delete_page.dart';
import 'get_page.dart';
import 'getbyid_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});
  final String title;
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GetPage()),
                );
              },
              child: const Text('Get'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GetByIdPage()),
                );
              },
              child: const Text('Get By Id'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PostPage()),
                );
              },
              child: const Text('Post'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PutPage()),
                );
              },
              child: const Text('Put'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DeletePage()),
                );
              },
              child: const Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
