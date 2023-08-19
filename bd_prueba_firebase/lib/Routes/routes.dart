import 'package:bd_prueba_firebase/screens/get_page.dart';
import 'package:bd_prueba_firebase/screens/getbyid_page.dart';
import 'package:bd_prueba_firebase/screens/main_page.dart';
import 'package:flutter/material.dart';
import '../screens/post_page.dart';

class AppRouter {
  static const main = '/';
  static const postpage = "/PostData";
  // static const loginPage = "/login";
  static const getByIdPage = "/GetByIdData";
  static const getPage = "/GetData";

  static final Map<String, Widget Function(BuildContext)> routes = {
    main: (context) => const MainPage(
          title: 'Menu',
        ),
    getPage: (context) => GetPage(),
    postpage: (context) => const PostPage(),
    // loginPage: (context) => const LoginPage(),
    getByIdPage: (context) => GetByIdPage(),
    // authPage: (context) => const AuthPag(),
  };
}
