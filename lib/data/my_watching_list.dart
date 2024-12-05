import 'package:flutter/material.dart';
import 'package:tv_plus/models/movie_model.dart';

class MyWatchingList with ChangeNotifier{
  final List<MovieModel> _myWatchingListMovies = [];
  List<MovieModel> get myWatchingListMovies => _myWatchingListMovies;

  void addMovie(MovieModel movie){
    if(!_myWatchingListMovies.contains(movie)){
      _myWatchingListMovies.add(movie);
    }
    notifyListeners();
  }
  void deleteMovie(MovieModel movie){
    _myWatchingListMovies.remove(movie);
    notifyListeners();
  }
}