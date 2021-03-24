import 'package:dwm14/components/drawer.dart';
import 'package:dwm14/components/landing.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int nb = 0;
  Color color = Colors.blue;
  bool disable = false;
  String _selectedItemText = '';
  List list = [
    "Flutter",
    "React",
    "Ionic",
    "Xamarin",
  ];
  //List<Widget> list = [Landing(), Container(), Text('School')];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Flutter'),
      ),
      drawerEnableOpenDragGesture: !disable,
      drawer: DrawerMenu(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: 500,
              height: 300,
              child: Landing(),
            ),
          ],
        ),
      ),
    );
  }
}
