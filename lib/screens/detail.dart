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
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  default:
                    if (!snapshot.hasData) {
                      return Center(
                        child: Text('Aucun film na été trouvé'),
                      );
                    }
                    List infoMovie = snapshot.data;
                    return Center(
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(infoMovie[0].poster))),
                            ),
                            Text(infoMovie[0].title),
                            Text(infoMovie[0].year),
                            Text("durée du film: " +
                                infoMovie[0].runtime +
                                " minutes"),
                            SizedBox(height: 20),
                            Text("acteurs: " + infoMovie[0].actors.toString(),
                                textAlign: TextAlign.center),
                            SizedBox(height: 20),
                            Text("genre: " + infoMovie[0].kind.toString()),
                            SizedBox(height: 20),
                            Text(
                              "Description: " + infoMovie[0].plot,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 50),
                            SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(children: <Widget>[
                                  for (var i = 0;
                                      i < infoMovie[0].ratings.length;
                                      i++)
                                    Column(
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      infoMovie[0].ratings[i]
                                                          ['logo']))),
                                        ),
                                        Text(infoMovie[0].ratings[i]['source']),
                                        Text("note: " +
                                            infoMovie[0].ratings[i]['value']),
                                      ],
                                    ),
                                ]))
                          ],
                        ),
                      ),
                    );
                }
              }),
        ));
  }
}
