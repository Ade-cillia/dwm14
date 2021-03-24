import 'package:dwm14/constants/firebase.dart';
import 'package:dwm14/models/movie.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final ItemArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Detail'),
        ),
        body: SafeArea(
          child: FutureBuilder(
              future: getMoviesByTitle(args.title),
              builder: (context, snapshot) {
                List infoMovie = snapshot.data;
                return Container(
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(infoMovie[0].poster))),
                      ),
                      Text(infoMovie[0].title),
                      Text(infoMovie[0].year),
                    ],
                  ),
                );
              }),
        ));
  }
}
