
import 'package:flt_peliculas/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProviders extends ChangeNotifier {

  final String _baseUrl  = 'api.themoviedb.org';
  final String _apiKey   = '2dc633bd44fadfce2757273859ce7010';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies   = [];

  int _popularPage = 0;


  MoviesProviders() {
    print('MoviesProvider inicializado');

    getOnNowPlayingMovies();
    getPopularMovies();
  }

  Future <String> _getJsonData(String endpoint, [int page = 1]) async{
    var url = Uri.https( _baseUrl , endpoint, {
      'api_key' : _apiKey,
      'language': _language,
      'page'    : '$page'
    });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  getOnNowPlayingMovies() async {
    
    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getPopularMovies () async {

    _popularPage++;

    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);

    onDisplayMovies = [ ...popularMovies, ...popularResponse.results ];

    notifyListeners();
  }
 
}