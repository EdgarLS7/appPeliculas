import 'package:flutter/material.dart';
import 'package:flt_peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [

          Cardswiper()

          //listado horizontal de peliculas

        ]
      )
    );
  }
}
