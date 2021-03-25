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
                        child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16),
                              child: Text(
                                'Informations du profil',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ))
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0),
                            child: Icon(Icons.email),
                          ),
                          Text(userData[0].email),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0),
                            child: Icon(Icons.portrait),
                          ),
                          Text(userData[0].name),
                          Text(' ' + userData[0].firstname),
                          SizedBox(height: 35),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0),
                            child: Icon(Icons.house),
                          ),
                          Text("Habite à : " + userData[0].city),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(0.0, 32, 0.0, 16),
                              child: Text(
                                'Actions',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ))
                        ],
                      ),
                      GestureDetector(
                        onTap: () async {
                          await firebaseAuth.signOut();
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0),
                              child: Icon(Icons.backspace, color: Colors.red),
                            ),
                            Text('Déconnexion',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))));
          }

          return LoadingScreen();
        });
  }
}
