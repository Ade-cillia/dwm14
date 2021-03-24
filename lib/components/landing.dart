import 'package:dwm14/constants/firebase.dart';
import 'package:dwm14/models/movie.dart';
import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  const Landing({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getMovies(),
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
              List movies = snapshot.data;

              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/detail',
                              arguments:
                                  ItemArguments(title: movies[index].title));
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(movies[index].poster))),
                            ),
                            Text(movies[index].title),
                            Text(movies[index].year),
                            Text(movies[index].kind.toString()),
                          ],
                        ),
                      ),
                    );
                  });
          }
        });
  }
}
