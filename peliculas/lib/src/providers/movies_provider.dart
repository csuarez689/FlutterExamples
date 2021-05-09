import 'dart:async';
import 'dart:convert';

import 'package:peliculas/src/models/actor_model.dart';
import 'package:peliculas/src/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MoviesProvider {
  final _apiKey = 'd8c80175688ed2ddcc2478abf529dc7e';
  final _baseUrl = 'api.themoviedb.org';
  final _language = 'es-ES';
  bool _isLoading = false;

  int _popularMoviesPage = 0;
  List<Movie> _popularMovies = [];
  final _popularMoviesStreamController =
      StreamController<List<Movie>>.broadcast();

  void dispose() {
    _popularMoviesStreamController?.close();
  }

  Stream<List<Movie>> get popularMoviesStream =>
      _popularMoviesStreamController.stream;

  Function(List<Movie>) get popularMoviesSink =>
      _popularMoviesStreamController.sink.add;

  Future<List<Movie>> _processMovies(Uri url) async {
    final jsonResp = await http.get(url);
    final decodedData = json.decode(jsonResp.body);
    final movies = new Movies.fromJsonList(decodedData['results']);
    return movies.items;
  }

  Future<List<Movie>> getNowPlaying() async {
    final url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language});

    return await _processMovies(url);
  }

  Future<List<Movie>> getPopulars() async {
    if (_isLoading) return [];

    _isLoading = true;
    _popularMoviesPage++;

    final url = Uri.https(_baseUrl, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': _popularMoviesPage.toString()
    });

    final res = await _processMovies(url);
    _popularMovies.addAll(res);
    popularMoviesSink(_popularMovies);
    _isLoading = false;
    return res;
  }

  Future<List<Actor>> getMovieCast(int movieId) async {
    final url = Uri.https(_baseUrl, '3/movie/$movieId/credits',
        {'api_key': _apiKey, 'language': _language});

    final jsonResp = await http.get(url);
    final decodedData = json.decode(jsonResp.body);
    final cast = new Cast.fromJsonList(decodedData['cast']);
    return cast.items;
  }

  Future<List<Movie>> findMovie(String query) async {
    final url = Uri.https(_baseUrl, '3/search/movie',
        {'api_key': _apiKey, 'language': _language, 'query': query});

    return await _processMovies(url);
  }
}
