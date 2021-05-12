import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:primeflix/app/shared/models/movie_model.dart';
import 'movie_controller.dart';

class MoviePage extends StatefulWidget {
  final String title;
  const MoviePage({Key key, this.title = "Movie"}) : super(key: key);

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends ModularState<MoviePage, MovieController> {
  void initState() {
    super.initState();

    init();
  }

  init() async {
    var args = Modular.args;
    if (args?.data == null) {
      print('no args found');
      Modular.to.pop();
      return;
    }

    controller.setMovie(args.data['movieModel']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(LineAwesomeIcons.heart_1),
      ),
      body: Observer(builder: (_) {
        if (controller.movieModel == null) {
          return Center(child: CircularProgressIndicator());
        }

        return Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                banner(controller.movieModel.banner),
                body(controller.movieModel),
              ],
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Modular.to.pop(),
              ),
            ),
          ],
        );
      }),
    );
  }

  banner(imageUrl) {
    return Container(
      height: 300,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Theme.of(context).backgroundColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }

  body(MovieModel movie) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movie.name,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.3,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: watchLater()),
              SizedBox(width: 15),
              Expanded(child: watched()),
            ],
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              rating(),
              parentalRating(),
            ],
          ),
          SizedBox(height: 25),
          play(),
        ],
      ),
    );
  }

  parentalRating() {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          '16',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  watchLater() {
    return InkWell(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 3,
                color: Theme.of(context).primaryColor,
              ),
            ),
            child: IconButton(
              icon: Icon(Icons.add, color: Theme.of(context).primaryColor),
              color: Colors.white,
              onPressed: () {},
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Assistir mais tarde',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  watched() {
    return InkWell(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 3,
                color: Theme.of(context).primaryColor,
              ),
            ),
            child: IconButton(
              icon: Icon(Icons.check, color: Theme.of(context).primaryColor),
              color: Colors.white,
              onPressed: () {},
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Assistido',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  play() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: RaisedButton(
        onPressed: () {},
        color: Theme.of(context).primaryColor,
        child: Container(
          height: 50,
          child: Row(
            children: [
              Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
              Text(
                'Assistir agora',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  rating() {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.amber),
        Icon(Icons.star, color: Colors.amber),
        Icon(Icons.star, color: Colors.amber),
        Icon(Icons.star, color: Colors.amber),
        Icon(Icons.star_border, color: Colors.amber),
      ],
    );
  }
}
