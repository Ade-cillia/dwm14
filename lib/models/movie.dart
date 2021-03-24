import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  final String title, plot, runtime, year, poster;
  final List actors, kind, ratings;
  final Timestamp realeasedDeate;
  Movie(
      {this.title,
      this.plot,
      this.runtime,
      this.year,
      this.poster,
      this.actors,
      this.kind,
      this.ratings,
      this.realeasedDeate});

  fromJson(json) {
    return Movie(
      title: json['title'],
      plot: json['plot'],
      runtime: json['runtime'],
      year: json['year'],
      poster: json['poster'],
      actors: json['actors'],
      kind: json['kind'],
      ratings: json['ratings'],
      realeasedDeate: json['realeasedDeate'],
    );
  }
}

class ItemArguments {
  final String text;
  final String title;

  ItemArguments({this.text, this.title});
}
