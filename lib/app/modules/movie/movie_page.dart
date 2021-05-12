import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:primeflix/app/shared/models/movie_model.dart';
import 'package:primeflix/app/shared/models/movie_user_model.dart';
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

    await controller.setMovie(args.data['movieModel']);
    await controller.getMovies();
    if (controller.movieUserModel == null) {
      await controller.watchLater();
      await controller.getMovies();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Observer(builder: (_) {
        return FloatingActionButton(
          onPressed: () {
            controller.favorite();
          },
          child: Icon(
            controller.movieUserModel != null &&
                    controller.movieUserModel.favorite == 1
                ? LineAwesomeIcons.heart_1
                : LineAwesomeIcons.heart,
          ),
        );
      }),
      body: Observer(builder: (_) {
        if (controller.movieModel == null ||
            controller.movieUserModel == null) {
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
            Container(
              height: 200,
              child: AppBar(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () => Modular.to.pop(),
                ),
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
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
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
                    if (controller.movieUserModel != null &&
                        controller.movieUserModel.watched == 0)
                      Expanded(child: watchLater()),
                    SizedBox(width: 15),
                    if (controller.movieUserModel != null &&
                        controller.movieUserModel.watched == 1)
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
          ),
          horizontalListMovies(title: 'Filmes do mesmo gênero'),
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
    return Observer(builder: (_) {
      return InkWell(
        onTap: () async {
          await controller.watchLater();
        },
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
                icon: Icon(
                    controller.movieUserModel == null
                        ? Icons.add
                        : Icons.check_box,
                    color: Theme.of(context).primaryColor),
                color: Colors.white,
                onPressed: () async {
                  await controller.watchLater();
                },
              ),
            ),
            SizedBox(height: 10),
            Text(
              controller.movieUserModel == null
                  ? 'Na lista p/ assistir mais tarde '
                  : 'Assistir mais tarde',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    });
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
        onPressed: () {
          controller.watched();
        },
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
    return Observer(builder: (_) {
      if (controller.movieUserModel == null) {
        return Row(
          children: [
            IconButton(
              onPressed: () {
                controller.rating(1);
              },
              icon: Icon(Icons.star_border),
              color: Colors.amber,
            ),
            IconButton(
              onPressed: () {
                controller.rating(2);
              },
              icon: Icon(Icons.star_border),
              color: Colors.amber,
            ),
            IconButton(
              onPressed: () {
                controller.rating(3);
              },
              icon: Icon(Icons.star_border),
              color: Colors.amber,
            ),
            IconButton(
              onPressed: () {
                controller.rating(4);
              },
              icon: Icon(Icons.star_border),
              color: Colors.amber,
            ),
            IconButton(
              onPressed: () {
                controller.rating(5);
              },
              icon: Icon(Icons.star_border),
              color: Colors.amber,
            ),
          ],
        );
      }

      return Row(
        children: [
          IconButton(
            onPressed: () {
              controller.rating(1);
            },
            icon: Icon(controller.movieUserModel.note != null &&
                    controller.movieUserModel.note >= 1
                ? Icons.star
                : Icons.star_border),
            color: Colors.amber,
          ),
          IconButton(
            onPressed: () {
              controller.rating(2);
            },
            icon: Icon(controller.movieUserModel.note != null &&
                    controller.movieUserModel.note >= 2
                ? Icons.star
                : Icons.star_border),
            color: Colors.amber,
          ),
          IconButton(
            onPressed: () {
              controller.rating(3);
            },
            icon: Icon(controller.movieUserModel.note != null &&
                    controller.movieUserModel.note >= 3
                ? Icons.star
                : Icons.star_border),
            color: Colors.amber,
          ),
          IconButton(
            onPressed: () {
              controller.rating(4);
            },
            icon: Icon(controller.movieUserModel.note != null &&
                    controller.movieUserModel.note >= 4
                ? Icons.star
                : Icons.star_border),
            color: Colors.amber,
          ),
          IconButton(
            onPressed: () {
              controller.rating(5);
            },
            icon: Icon(controller.movieUserModel.note != null &&
                    controller.movieUserModel.note >= 5
                ? Icons.star
                : Icons.star_border),
            color: Colors.amber,
          ),
        ],
      );
    });
  }

  horizontalListMovies({@required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.3,
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 130,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: controller.homeController.listMovies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var movies = controller.homeController.listMovies;

                return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 16.0 : 8.0,
                  ),
                  child: InkWell(
                    onTap: () {
                      Modular.to.pushNamed(
                        '/movie',
                        arguments: {
                          'movieModel': movies[index],
                        },
                      );
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          width: 170,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(movies[index].image),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 170,
                          child: Text(
                            movies[index].name,
                            style: GoogleFonts.poppins(
                                color: Colors.grey, fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
