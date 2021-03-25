import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dwm14/models/movie.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firebaseAuth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;

isLogged() {
  return firebaseAuth.currentUser;
}

getMovies() async {
  List result = [];
  final movies = await firestore.collection('movies').get();
  if (movies.docs != null) {
    result = movies.docs.map((doc) => Movie().fromJson(doc.data())).toList();
  }
  return result;
}

getMoviesByTitle(title) async {
  List result = [];
  final movies = await firestore
      .collection("movies")
      .where('title', isEqualTo: title)
      .get();

  if (movies.docs != null) {
    result = movies.docs.map((doc) => Movie().fromJson(doc.data())).toList();
  }
  return result;
}

getUserInfo(email) async {
  List result = [];
  final userInfo = await firestore
      .collection('users')
      .where('email', isEqualTo: email)
      .get();
  if (userInfo.docs != null) {
    result = userInfo.docs.map((doc) => Movie().fromJson(doc.data())).toList();
  }
  return result;
}
