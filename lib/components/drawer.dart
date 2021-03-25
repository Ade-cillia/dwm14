import 'package:dwm14/constants/firebase.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: Text('Accueil'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          ListTile(
              title: Text('Categorie'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/category');
            },
          ),
          ),
          ListTile(
            title: Text('Profil'),
            
            onTap: () {
              Navigator.pushReplacementNamed(context, '/profile');
            },
          ),
          ListTile(
            title: Text('Déconnexion',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            onTap: () async {
              await firebaseAuth.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      )),
    );
  }
}
