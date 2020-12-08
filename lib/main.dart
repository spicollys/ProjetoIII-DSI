import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:setup_wizard/app/pages/game_genre/game_genre_page.dart';
import 'package:setup_wizard/app/pages/game_list/game_list_page.dart';
import 'package:setup_wizard/app/pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/gameGenrePage',
        routes: {
          '/gameGenrePage': (context) => GameGenrePage(),
          '/gameListPage': (context) => GameListPage(),
          '/loginPage': (context) => LoginPage(),
        });
  }
}