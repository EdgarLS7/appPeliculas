import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text('Populares', style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold),)
          ),
          
          const SizedBox(height: 3,),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: ( _ , int index) => const _MoviePoster()
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 190,
      margin: const EdgeInsets.symmetric( horizontal: 10),
      child: Column(
        children: [

          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/details',arguments: 'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage('https://via.Placeholder.com/300x500'),
                width: 125,
                height: 160,
                fit: BoxFit.cover,
                ),
            ),
          ),

            const SizedBox(height: 3,),

            const Text('Titulo',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center, 
              style: TextStyle(fontSize: 12),
            )
        ],
      ),
    );
  }
}