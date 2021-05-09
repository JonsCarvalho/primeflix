import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'movie_controller.dart';

class MoviePage extends StatefulWidget {
  final String title;
  const MoviePage({Key key, this.title = "Movie"}) : super(key: key);

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends ModularState<MoviePage, MovieController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
