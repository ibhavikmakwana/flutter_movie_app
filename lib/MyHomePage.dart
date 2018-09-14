import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_movie_app/MovieItem.dart';
import 'package:flutter_movie_app/MovieResModel.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title});

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url =
      "https://api.themoviedb.org/3/movie/now_playing?api_key=2b13425d3645e4f89493380fe35a1e21";

  MovieResponse movie;

  @override
  void initState() {
    super.initState();
//    print(1);
    fetchMovies();
//    print(3);
  }

  fetchMovies() async {
    var response = await http.get(url);
    var decodedJson = jsonDecode(response.body);
//    movie = MovieResponse.fromJson(decodedJson);
    print(movie);
    print(response.body);
    setState(() {
      movie = MovieResponse.fromJson(decodedJson);
    });
//    print(2);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: movie == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return MovieItem(
                  movie: movie.results[index],);
              },
              itemCount: movie.results.length,
            ),
    );
  }
}
