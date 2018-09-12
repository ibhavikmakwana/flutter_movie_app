import 'package:flutter/material.dart';
import 'package:flutter_movie_app/MovieDetail.dart';
import 'package:flutter_movie_app/MovieResModel.dart';

class MovieItem extends StatelessWidget {
  final Results movie;

  MovieItem({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 8.0,
      margin: EdgeInsets.all(16.0),
      child: InkWell(
        radius: 8.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: movie.posterPath,
              child: Container(
                height: 200.0,
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 8.0)],
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                      image: NetworkImage(
                        "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
                      ),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    movie.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.title,
                  ),
                  Text(
                    movie.overview,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.body2,
                  ),
                ],
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetail(
                    movie: movie,
                  ),
            ),
          );
        },
      ),
    );
  }
}
