import 'package:flutter/material.dart';
import 'package:peliculas/src/models/movie_model.dart';
import 'package:peliculas/src/providers/movies_provider.dart';

class DataSearch extends SearchDelegate {
  final _moviesProvider = new MoviesProvider();
  final _peliculas = [
    'Spiderman',
    'Linterna Verde',
    'Capitan America',
    'Batman',
    'Superman',
    'Avengers',
    'Nobody',
    'Tom & Jerry',
    'Mortal Kombat',
    'Monster Hunter',
    'Justice League'
  ];
  final _recientes = ['Spiderman', 'Capitan America'];

  // Las acciones del widget de busqueda
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  //Icono a la izquierda del widget de busqueda
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

// Crea los resultados a mostrar
  @override
  Widget buildResults(BuildContext context) {
    // return Center(
    //     child: Container(
    //   height: 100.0,
    //   width: 100.0,
    //   color: Colors.blueAccent,
    //   child: Text(_selected),
    // ));
    throw UnimplementedError();
  }

// Sugerencias que aparecen cuando se escribe en el widget
  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) return Container();
    return FutureBuilder(
      future: _moviesProvider.findMovie(query),
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        if (snapshot.hasData) {
          final movies = snapshot.data;

          return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) =>
                  _listTileMovie(context, movies[index]));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _listTileMovie(BuildContext context, Movie movie) => ListTile(
      leading: FadeInImage(
        image: NetworkImage(movie.getPosterUrl()),
        placeholder: AssetImage('resources/images/no-image.jpg'),
        width: 50.0,
        fit: BoxFit.fill,
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
      onTap: () {
        close(context, null);
        movie.uniqueIdApp = '';
        Navigator.pushNamed(context, 'detailMovie', arguments: movie);
      });

  // @override
  // Widget buildSuggestions(BuildContext context) {
  //   final searchList = query.isEmpty
  //       ? _recientes
  //       : _peliculas
  //           .where(
  //               (movie) => movie.toLowerCase().startsWith(query.toLowerCase()))
  //           .toList();

  //   return ListView.builder(
  //       itemBuilder: (context, index) => ListTile(
  //             leading: Icon(Icons.movie),
  //             title: Text(searchList[index]),
  //             onTap: () {
  //               // _selected = searchList[index];
  //               // showResults(context);
  //             },
  //           ),
  //       itemCount: searchList.length);
  // }
}
