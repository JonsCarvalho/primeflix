import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:primeflix/app/modules/profile/profile_module.dart';
import 'package:primeflix/app/modules/search/search_module.dart';
import 'package:primeflix/app/shared/models/movie_model.dart';
import 'components/navigation_bar/navigation_bar_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  CarouselController buttonCarouselController = CarouselController();
  int _current = 0;

  void initState() {
    controller.pageController = PageController();
    init();
    super.initState();
  }

  init() async {
    var args = Modular.args;
    if (args?.data == null) {
      print('no args found');
      Modular.to.pop();
      return;
    }

    controller.setUser(args.data['user']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('primeflix', style: GoogleFonts.bebasNeue()),
      ),
      bottomNavigationBar: NavigationBarWidget(),
      body: Observer(
        builder: (_) {
          return PageView(
            controller: controller.pageController,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              pageHome(),
              RouterOutlet(module: SearchModule()),
              RouterOutlet(module: ProfileModule()),
            ],
          );
        },
      ),
    );
  }

  pageHome() {
    return Observer(builder: (_) {
      if (controller.loading) {
        return Center(child: CircularProgressIndicator());
      }

      if (controller.listMovies == null ||
          controller.listRecentMovies == null) {
        return Center(child: Text('Erro na requisição!'));
      }

      List<Widget> recentListWidget =
          controller.listRecentMovies.map((movie) => banner(movie)).toList();

      return ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          carousel(recentListWidget),
          horizontalListMovies(title: 'Filmes mais populares'),
          horizontalListMovies(title: 'Ação e aventura'),
          horizontalListMovies(title: 'Filmes da Marvel'),
          horizontalListMovies(title: 'Filmes mais populares'),
        ],
      );
    });
  }

  horizontalListMovies({@required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
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
              itemCount: controller.listMovies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var movies = controller.listMovies;

                return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 16.0 : 8.0,
                  ),
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget carousel(List<Widget> recentListWidget) {
    return Stack(
      children: [
        CarouselSlider(
          items: recentListWidget,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: false,
              viewportFraction: 1,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: recentListWidget.map((movie) {
              int index = recentListWidget.indexOf(movie);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index ? Colors.white : Colors.grey[400],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget banner(MovieModel movie) {
    return InkWell(
      onTap: () {
        Modular.to.pushNamed(
          '/movie',
          arguments: {
            'movieModel': movie,
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(movie.banner),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
