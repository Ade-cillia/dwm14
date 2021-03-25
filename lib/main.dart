import 'package:dwm14/routes.dart';
import 'package:dwm14/screens/error.dart';
import 'package:dwm14/screens/loading.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'constants/firebase.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorScreen();
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                accentColor: Colors.pink,
                brightness: Brightness.light,
                primaryColor: Colors.deepPurple,
              ),
              darkTheme: ThemeData(
                accentColor: Colors.blue,
                brightness: Brightness.dark,
                primaryColor: Colors.teal,
                scaffoldBackgroundColor: const Color(0xFF1F1E23),
              ),
              routes: routes,
              initialRoute: isLogged() != null ? '/home' : '/login',
            );
          }

          return LoadingScreen();
        });
  }
}
