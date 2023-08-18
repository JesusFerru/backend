import 'package:bd_prueba_firebase/screens/page_404.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'Routes/routes.dart';
import 'backend/services/person_services.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Logger.root.level = Level.ALL;

  // Agrega un manejador para imprimir los mensajes de registro en la consola
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  runApp(const MyApp());

  // Llama al método postPerson para guardar los datos en Firestore
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prueba app',
      initialRoute: AppRouter.main,
      routes: AppRouter.routes,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const Page404(),
        );
      },
    );
  }
}
