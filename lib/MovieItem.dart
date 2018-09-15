import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/MovieDetail.dart';
import 'package:flutter_movie_app/MovieResModel.dart';

/*
Movie Item Layout for the ListView
 */
class MovieItem extends StatelessWidget {
  final Results movie;

  /*
   * movie object 
   */
  MovieItem({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Card
      shape: RoundedRectangleBorder(
        // shape of the card
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 8.0,
      margin: EdgeInsets.all(16.0),
      child: InkWell(
        //for listening for gestures without ink splashes.
        radius: 8.0,
        child: getCardView(context),
        onTap: () {
          //This widget is used to navigate from one screen to another
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  MovieDetail(
                    movie: movie,
                  ),
            ),
          );
        },
      ),
    );
  }

  /*
  Returns the column containing card layout for the item list
   */
  getCardView(BuildContext context) {
    return Column(
      // Column start
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Hero(
          // To do the animation
          tag: movie.posterPath, // must be unique for the proper animation
          child: Container(
            //container for giving border to the image
            height: 200.0,
            decoration: BoxDecoration(
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
                style: Theme
                    .of(context)
                    .textTheme
                    .title,
              ),
              Text(
                movie.overview,
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme
                    .of(context)
                    .textTheme
                    .body2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
