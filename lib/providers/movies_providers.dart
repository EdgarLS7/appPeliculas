import 'dart:convert';

import 'package:flt_peliculas/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {

  String _baseUrl  = 'api.themoviedb.org';
  String _apiKey   = '2dc633bd44fadfce2757273859ce7010';
  String _language = 'es-ES';

  MoviesProvider() {
    print('MoviesProvider inicializado');

    this.getOnNowPlayingMovies();
  }

  getOnNowPlayingMovies() async {
    var url = Uri.https( _baseUrl , '3/movie/now_playing', {
      'api_key' :_apiKey,
      'language':_language,
      'page': '1'
    });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    print(nowPlayingResponse.results[0].title);
  }
 
}