import 'package:flutter/material.dart';
import 'package:peliculas/src/models/movie_model.dart';

class MoviesHorizontal extends StatelessWidget {
  final List<Movie> movies;
  final _pageController =
      new PageController(initialPage: 1, viewportFraction: 0.3);
  final Function getNextPage;

  MoviesHorizontal({@required this.movies, @required this.getNextPage}) {
    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        getNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      height: _screenSize.height * 0.3,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        pageSnapping: false,
        controller: _pageController,
        itemBuilder: (context, index) => _movieCard(context, movies[index]),
      ),
    );
  }

  Widget _movieCard(BuildContext context, Movie movie) {
    movie.uniqueIdApp = '${movie.id}-card';

    final card = Container(
      margin: EdgeInsets.only(right: 10.0),
      child: Column(
        children: <Widget>[
          Hero(
            tag: movie.uniqueIdApp,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(movie.getPosterUrl()),
                placeholder: AssetImage('resources/images/no-image.jpg'),
                fit: BoxFit.fill,
                height: 160.0,
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );

    return GestureDetector(
      child: card,
      onTap: () {
        Navigator.pushNamed(context, 'detailMovie', arguments: movie);
      },
    );
  }
}
