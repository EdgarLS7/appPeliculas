import 'package:flt_peliculas/models/models.dart';
import 'package:flutter/material.dart';

class MovieSlider extends StatefulWidget {

  final List <Movie> movies;
  final String? title;
  final Function onNextPage;

  const MovieSlider({
    Key? key, 
    required this.movies, 
    this.title, 
    required this.onNextPage
  }) : super(key: key);

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() { 
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500) {
        widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          if (widget.title != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text( widget.title!, 
            style: const TextStyle( fontSize: 15, fontWeight: FontWeight.bold),)
          ),
          
          const SizedBox(height: 3,),

          //Slide lateral
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: ( _, int index) => _MoviePoster(widget.movies[index])
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {

  final Movie movie;

  const _MoviePoster (this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 190,
      margin: const EdgeInsets.symmetric( horizontal: 10),
      child: Column(
        children: [

          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/details',arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'), 
                image: NetworkImage( movie.fullPosterImg ),
                width: 125,
                height: 160,
                fit: BoxFit.cover,
                ),
            ),
          ),

            const SizedBox(height: 3,),

            Text(
              movie.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center, 
              style: const TextStyle(fontSize: 12),
            )
        ],
      ),
    );
  }
}