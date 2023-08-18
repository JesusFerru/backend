import 'package:bd_prueba_firebase/screens/main_page.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../screens/post_page.dart';

class AppRouter {
  static const main = '/';
  static const postData = "/PostData";
  static const loginPage = "/login";
  static const testPage = "/testPage";
  static const getPage = "/pruebaPage";

  static final Map<String, Widget Function(BuildContext)> routes = {
    main: (context) => const MainPage(
          title: 'Menu',
        ),
    // pruebaPage: (context) => const Home(),
    // postData: (context) => const PostPage(),
    // loginPage: (context) => const LoginPage(),
    // testPage: (context) => TestPage(),
    // authPage: (context) => const AuthPag(),
  };
}
