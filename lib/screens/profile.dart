import 'package:dwm14/components/drawer.dart';
import 'package:dwm14/screens/error.dart';
import 'package:dwm14/constants/firebase.dart';
import 'package:flutter/material.dart';
import 'package:dwm14/screens/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';

User user = FirebaseAuth.instance.currentUser;

class ProfileScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUserInfo(user.email),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorScreen();
          }
          List userData = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text('Profil'),
                ),
                drawer: DrawerMenu(),
                body: SafeArea(
                    child: Container(
                  child: Center(
                    child: Column(
                      children: [
                        Text("email: " + userData[0].email),
                        Text("Nom: " + userData[0].name),
                        Text("Prénom: " + userData[0].firstname),
                        Text("Ville: " + userData[0].city),
                      ],
                    ),
                  ),
                )));
          }

          return LoadingScreen();
        });
  }
}
