
import 'package:flt_peliculas/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProviders extends ChangeNotifier {

  final String _baseUrl  = 'api.themoviedb.org';
  final String _apiKey   = '2dc633bd44fadfce2757273859ce7010';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies   = [];


  MoviesProviders() {
    print('MoviesProvider inicializado');

    getOnNowPlayingMovies();
    getPopularMovies();
  }

  getOnNowPlayingMovies() async {
    var url = Uri.https( _baseUrl , '3/movie/now_playing', {
      'api_key' : _apiKey,
      'language': _language,
      'page'    : '1'
    });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }
  getPopularMovies () async {
    var url = Uri.https(_baseUrl, '3/movie/popular', {
      'api_key' : _apiKey, 
      'language': _language, 
      'page'    : '1'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);

    onDisplayMovies = [ ...popularMovies, ...popularResponse.results ];

    notifyListeners();
  }
 
}