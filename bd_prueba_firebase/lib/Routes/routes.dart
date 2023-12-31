import 'package:bd_prueba_firebase/screens/get_page.dart';
import 'package:bd_prueba_firebase/screens/getbyid_page.dart';
import 'package:bd_prueba_firebase/screens/main_page.dart';
import 'package:flutter/material.dart';
import '../screens/delete_page.dart';
import '../screens/post_page.dart';
import '../screens/put_page.dart';

class AppRouter {
  static const main = '/';
  // static const loginPage = "/login";
  static const getbyidpage = "/GetByIdData";
  static const getpage = "/GetData";
  static const postpage = "/PostData";
  static const putpage = "/PutData";
  static const deletepage = "/DeleteData";

  static final Map<String, Widget Function(BuildContext)> routes = {
    main: (context) => const MainPage(
          title: 'Menu',
        ),
    getpage: (context) => GetPage(),
    postpage: (context) => const PostPage(),
    // loginPage: (context) => const LoginPage(),
    getbyidpage: (context) => const GetByIdPage(),
    putpage: (context) => PutPage(),
    deletepage: (context) => const DeletePage(),
  };
}
