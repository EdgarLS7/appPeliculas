import 'package:flt_peliculas/providers/movies_providers.dart';
import 'package:flutter/material.dart';
import 'package:flt_peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  
  @override 
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProviders>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
      
            // tarjetas principales
            Cardswiper(movies: moviesProvider.onDisplayMovies ),
      
            //slider de peliculas
            MovieSlider(),
          
          ]
        ),
      )
    );
  }
}
