import 'package:dwm14/components/drawer.dart';
import 'package:dwm14/components/landing.dart';
import 'package:dwm14/components/searchBar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int nb = 0;
  Color color = Colors.blue;
  bool disable = false;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Flutter'),
        ),
        drawerEnableOpenDragGesture: !disable,
        drawer: DrawerMenu(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                width: 500,
                height: 300,
                child: Landing(),
              ),
              Container(
                height: 400,
                child: SearchBar(),
              ),
            ]),
          ),
        ));
  }
}

class Test extends StatelessWidget {
  const Test({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}
