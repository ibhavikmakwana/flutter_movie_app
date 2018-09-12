import 'package:flutter/material.dart';
import 'package:flutter_movie_app/MovieResModel.dart';

class MovieDetail extends StatelessWidget {
  final Results movie;

  MovieDetail({this.movie});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.bookmark_border),
        ),
        body: Scaffold(
          backgroundColor: Colors.grey,
          body: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Hero(
                      tag: movie.posterPath,
                      child: Container(
                        height: 500.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      movie.title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      movie.overview,
                      style: Theme.of(context).textTheme.subhead,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
