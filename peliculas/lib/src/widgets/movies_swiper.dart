import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/movie_model.dart';

class MoviesSwiper extends StatelessWidget {
  final List<Movie> movies;

  MoviesSwiper({@required this.movies});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        itemCount: movies.length,
        itemHeight: _screenSize.height * 0.49,
        itemWidth: _screenSize.width * 0.6,
        layout: SwiperLayout.STACK,
        itemBuilder: (BuildContext context, int index) {
          movies[index].uniqueIdApp = '${movies[index].id}-swiper';
          final card = Hero(
              tag: movies[index].uniqueIdApp,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(movies[index].getPosterUrl()),
                  placeholder: AssetImage('resources/images/no-image.jpg'),
                ),
              ));
          return GestureDetector(
            child: card,
            onTap: () {
              Navigator.pushNamed(context, 'detailMovie',
                  arguments: movies[index]);
            },
          );
        },
      ),
    );
  }
}
