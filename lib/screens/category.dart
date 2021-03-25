import 'package:dwm14/components/drawer.dart';
import 'package:dwm14/constants/firebase.dart';
import 'package:dwm14/models/movie.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String categorySelected = "";
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
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Column(children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          categorySelected = 'Crime';
                        });
                      },
                      child: Column(
                        children: [Text('Crime')],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          categorySelected = 'Drama';
                        });
                      },
                      child: Column(
                        children: [Text('Drama')],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          categorySelected = 'Action';
                        });
                      },
                      child: Column(
                        children: [Text('Action')],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          categorySelected = 'Thriller';
                        });
                      },
                      child: Column(
                        children: [Text('Thriller')],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          categorySelected = 'Sci-Fi';
                        });
                      },
                      child: Column(
                        children: [Text('Sci-Fi')],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          categorySelected = 'Adventure';
                        });
                      },
                      child: Column(
                        children: [Text('Adventure')],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          categorySelected = 'Fantasy';
                        });
                      },
                      child: Column(
                        children: [Text('Fantasy')],
                      ),
                    ),
                  ]),
                ),
              ),
              //Text('oui'),
              FutureBuilder(
                  future: getMovies(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: Text('Aucun film na été trouvé'),
                      );
                    }
                    List movies = snapshot.data;

                    return SizedBox(
                      height: 300,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: movies.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                for (var j = 0;
                                    j < movies[index].kind.length;
                                    j++)
                                  if (movies[index].kind[j] == categorySelected)
                                    Padding(
                                      padding: EdgeInsets.all(8),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/detail',
                                              arguments: ItemArguments(
                                                  title: movies[index].title));
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 200,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          movies[index]
                                                              .poster))),
                                            ),
                                            Text(movies[index].title),
                                            Text(movies[index].year),
                                            Text(movies[index].kind.toString()),
                                          ],
                                        ),
                                      ),
                                    ),
                              ],
                            );
                          }),
                    );
                  }),
            ],
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
