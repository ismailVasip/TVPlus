import 'package:flutter/material.dart';
import 'package:tv_plus/models/movie_model.dart';

class MyDownloadedMovies with ChangeNotifier{
  final List<MovieModel> _downloadedMovies = [];
  List<MovieModel> get myDownloadedMovies => _downloadedMovies;

  void addMovie(MovieModel movie){
    if(!_downloadedMovies.contains(movie)){
      _downloadedMovies.add(movie);
    }
    notifyListeners();
  }
  void deleteMovie(MovieModel movie){
    _downloadedMovies.remove(movie);
    notifyListeners();
  }
}