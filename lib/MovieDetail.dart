import 'package:flutter/material.dart';

class MovieDetail extends StatelessWidget {
  final String title;

  MovieDetail(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
