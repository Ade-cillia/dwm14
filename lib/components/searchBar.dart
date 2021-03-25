import 'package:dwm14/constants/firebase.dart';
import 'package:dwm14/models/movie.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _textController = TextEditingController();
  static List moviesTitle = [];
  List newDataList = List.from(moviesTitle);
  getMovieTitle(moviesData) {
    moviesTitle = [];
    for (var i = 0; i < moviesData.length; i++) {
      moviesTitle.add(moviesData[i].title);
    }
  }

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
              List moviesData = snapshot.data;
              getMovieTitle(moviesData);
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: 'Rechercher un film..',
                      ),
                      onChanged: (String value) {
                        print(moviesTitle);
                        setState(() {
                          newDataList = moviesTitle
                              .where((string) => string
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.all(12.0),
                      children: newDataList.map((data) {
                        return ListTile(
                          title: Text(data),
                          onTap: () => Navigator.pushNamed(context, '/detail',
                              arguments: ItemArguments(title: data)),
                        );
                      }).toList(),
                    ),
                  )
                ],
              );
          }
        });
  }
}
